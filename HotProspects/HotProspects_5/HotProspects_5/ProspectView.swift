//
//  ProspectView.swift
//  HotProspects_5
//
//  Created by David Stanton on 4/26/24.
//
import CodeScanner
import SwiftData
import SwiftUI
import UserNotifications

struct ProspectView: View {
    enum FilterTypes {
        case none, contacted, uncontacted
    }
    let filter: FilterTypes
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var isShowingScan = false
    @State private var selectedProspects = Set<Prospect>()

    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted"
        case .uncontacted:
            "Uncontacted"
        }
    }
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    if prospect.isContacted {
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                        
                        Button("Create Notification", systemImage: "bell") {
                            addNotification(for: prospect)
                        }
                        .tint(.orange)
                    }
                }
                .tag(prospect)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan QR Code", systemImage: "qrcode.viewfinder") {
                        isShowingScan = true
                    }
                }
                
                if selectedProspects.isEmpty == false {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete Selected", role: .destructive, action: deleteSelected)
                    }
                }
            }
            .sheet(isPresented: $isShowingScan) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Buzz Lightyear\nWhamOToys", completion: handleScan)
            }
        }
    }
    init(filter: FilterTypes) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = filter == .contacted
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    
    func deleteSelected() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScan = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let prospect = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            modelContext.insert(prospect)
        case .failure(let error):
            print("There was an error scanning the QR Code \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = "at \(prospect.emailAddress)"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectView(filter: .none)
        .modelContainer(for: Prospect.self)
}

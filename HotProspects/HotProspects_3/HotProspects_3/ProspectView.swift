//
//  ProspectView.swift
//  HotProspects_3
//
//  Created by David Stanton on 4/23/24.
//
import CodeScanner
import SwiftData
import SwiftUI
import UserNotifications

struct ProspectView: View {
    enum FilterTypes {
        case none, contacted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    
    let filter: FilterTypes
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
                    Text(prospect.email)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    if prospect.isContacted == false {
                        Button("Mark Contacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                        Button("Create Reminder", systemImage: "bell") {
                            addNotification(for: prospect)
                        }
                        .tint(.orange)
                    } else {
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    }
                }
                .tag(prospect)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                if selectedProspects.isEmpty == false {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete Selected") {
                            deleteSelected()
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
    }
    
    init(filter: FilterTypes) {
        self.filter = filter
        
        if filter != .none {
            let isContacted = filter == .contacted
            _prospects = Query(filter: #Predicate {
                $0.isContacted == isContacted
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            let prospect = Prospect(name: details[0], email: details[1], isContacted: false)
            modelContext.insert(prospect)
        case .failure(let error):
            print("There was an error scanning \(error.localizedDescription)")
        }
    }
    
    func deleteSelected() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = "At email address: \(prospect.email)"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.badge, .alert, .sound]) { success, error in
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

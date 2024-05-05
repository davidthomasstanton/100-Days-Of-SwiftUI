//
//  EditCardsView.swift
//  Flashzilla_1
//
//  Created by David Stanton on 5/3/24.
//
// EditCards: View
// Section to Add new card, "newPrompt" "newAnswer" Button to "addCard"
// Section to list all cards, modifier to removeCards
// func done() to exit
// func loadData()
// func saveData()
// func addCard() making sure entries aren't empty
// func removeCards()

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newAnswer = ""
    @State private var newPrompt = ""
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("\(newPrompt)", text: $newPrompt)
                    TextField("\(newAnswer)", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }
    func done() {
        dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.setValue(data, forKey: "Cards")
        }
    }
    
    func addCard() {
        let prompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let answer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard prompt.isEmpty == false && answer.isEmpty == false else { return }
        let newCard = Card(id: UUID(), prompt: prompt, answer: answer)
        cards.insert(newCard, at: 0)
        
        newPrompt = ""
        newAnswer = ""
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

#Preview {
    EditCardsView()
}

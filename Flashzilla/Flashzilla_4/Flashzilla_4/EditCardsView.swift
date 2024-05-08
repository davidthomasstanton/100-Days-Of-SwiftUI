//
//  EditCardsView.swift
//  Flashzilla_4
//
//  Created by David Stanton on 5/7/24.
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
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    var body: some View {
        NavigationStack {
            List {
                Section("Add Card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                Section("Cards") {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                            Text(cards[index].answer)
                        }
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
        if !prompt.isEmpty && !answer.isEmpty {
            let newCard = Card(id: UUID(), prompt: prompt, answer: answer)
            cards.insert(newCard, at: 0)
            saveData()
        }
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offset: IndexSet) {
        cards.remove(atOffsets: offset)
        saveData()
    }
}

#Preview {
    EditCardsView()
}

//
//  EditCardsView.swift
//  Flashzilla_2
//
//  Created by David Stanton on 5/4/24.
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
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("?", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCard)
                }
            }
            .navigationTitle("Edit Cards")
            .onAppear(perform: loadData)
            .toolbar {
                Button("Done", action: done)
            }
            
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
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    func addCard() {
        let prompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let answer = newAnswer.trimmingCharacters(in: .whitespaces)
        if !prompt.isEmpty && !answer.isEmpty {
            let card = Card(prompt: prompt, answer: answer)
            cards.insert(card, at: 0)
            saveData()
            
            newPrompt = ""
            newAnswer = ""
        }
    }
    func removeCard(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
}

#Preview {
    EditCardsView()
}

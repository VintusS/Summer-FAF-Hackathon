//
//  LikeButtonView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct LikeButtonView: View {
    let width: CGFloat
    let height: CGFloat
    @State private var isLiked: Bool = false
    let card: Card

    var body: some View {
        Button(action: {
            isLiked.toggle()
            if isLiked {
                saveCard(card)
            } else {
                removeCard(card)
            }
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .foregroundColor(isLiked ? .red : .black)
        }
        .onAppear {
            isLiked = isCardSaved(card)
        }
    }

    private func saveCard(_ card: Card) {
        var savedCards = getSavedCards()
        savedCards.append(card)
        UserDefaults.standard.set(try? JSONEncoder().encode(savedCards), forKey: "savedCards")
    }

    private func removeCard(_ card: Card) {
        var savedCards = getSavedCards()
        savedCards.removeAll { $0.id == card.id }
        UserDefaults.standard.set(try? JSONEncoder().encode(savedCards), forKey: "savedCards")
    }

    private func isCardSaved(_ card: Card) -> Bool {
        let savedCards = getSavedCards()
        return savedCards.contains { $0.id == card.id }
    }

    private func getSavedCards() -> [Card] {
        guard let data = UserDefaults.standard.data(forKey: "savedCards"),
              let savedCards = try? JSONDecoder().decode([Card].self, from: data) else {
            return []
        }
        return savedCards
    }
}

struct Card: Identifiable, Codable {
    let id: UUID
    let imageUrl: String
    let modelName: String
    let price: String
    let details: String
}


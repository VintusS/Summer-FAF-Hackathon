//
//  SavedCardView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct SavedCardView: View {
    @State private var savedCards: [Card] = []

    var body: some View {
        NavigationView {
            ZStack {
                // Your main content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Saved Cars")
                                .font(.custom("GTWalsheimTrial-Md", size: 30))
                            Spacer()
                        }
                        ForEach(savedCards) { card in
                            CardView(card: card)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                }
                .background(Color(hex: "#f3f3f3"))
                
                VStack {
                    Spacer()
                    FloatingFooterMenu()
                        .padding(.horizontal, 30)
                }
            }
            .background(Color(hex: "#f3f3f3"))
            .onAppear {
                loadSavedCards()
            }
        }
    }

    private func loadSavedCards() {
        guard let data = UserDefaults.standard.data(forKey: "savedCards"),
              let savedCards = try? JSONDecoder().decode([Card].self, from: data) else {
            return
        }
        self.savedCards = savedCards
    }
}

struct SavedCardView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCardView()
    }
}


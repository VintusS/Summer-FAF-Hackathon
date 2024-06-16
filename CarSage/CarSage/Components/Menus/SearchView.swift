//
//  SearchView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    SurveyView(
                        question: "What are your favorite colors?",
                        answers: ["Red", "Blue", "Green", "Yellow"],
                        multipleChoice: true,
                        isLast: false
                    )
                }
                .background(Color(hex: "#f3f3f3"))
            }
            .background(Color(hex: "#f3f3f3"))
        }
    }
}

#Preview {
    SearchView()
}

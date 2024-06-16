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
            SurveyView(
                question: "Do you know what you’re looking for?",
                subheading: "",
                answers: ["I know the make and model", "I'm not sure what I want"],
                multipleChoice: false,
                isLast: false
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top)
            .background(Color(hex: "#f3f3f3"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    SearchView()
}

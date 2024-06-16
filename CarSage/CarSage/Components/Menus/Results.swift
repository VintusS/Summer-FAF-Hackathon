//
//  Results.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct Results: View {
    @State private var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Text("Searching for a car for you")
                        .font(.custom("GTWalsheimTrial-Rg", size: 20))
                        .padding(.top, 10)
                }
            } else {
                Text("Hello, World!")
                    .font(.custom("GTWalsheimTrial-Lt", size: 20))
            }
        }
        .onAppear {
            simulateLoading()
        }
    }

    func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            isLoading = false
        }
    }
}

#Preview {
    Results()
}

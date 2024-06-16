//
//  Results.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct Results: View {
    @State private var isLoading = true
    let cars = loadResults()
    
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
                NavigationView {
                    ZStack {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Suggested Cars")
                                    .font(.custom("GTWalsheimTrial-Md", size: 30))
                                Text("Here's a list of cars picked just for you")
                                    .font(.custom("GTWalsheimTrial-Lt", size: 15))
                                ForEach(cars) { car in
                                    CardView1(card: car)
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
                }
            }
        }
        .onAppear {
            simulateLoading()
        }
    }

    func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isLoading = false
        }
    }
}

#Preview {
    Results()
}

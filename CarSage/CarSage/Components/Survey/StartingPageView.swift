//
//  LastSurveyView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct StartingPageView: View {
    var body: some View {
        ZStack {
            // Background image
            Image("Starting Background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Title text
                HStack {
                    Text("Enjoy a new experience.")
                        .font(.custom("GTWalsheimTrial-Rg", size: 29))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    Text("Search for a new car, buy it, and enjoy the ride.")
                        .font(.custom("GTWalsheimTrial-Lt", size: 20))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom)
                    Spacer()
                }
                .padding()
                .padding(.bottom, 10)
                
                // Button
                Button(action: {
                    // Action for button press
                }) {
                    Text("Let's Start")
                        .font(.custom("GTWalsheimTrial-Rg", size: 24))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 50)
                }
                
            }
        }
    }
}

#Preview {
    StartingPageView()
}

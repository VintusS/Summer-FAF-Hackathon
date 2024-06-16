//
//  ButtonView1.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct ButtonView1<Destination: View>: View {
    let width: CGFloat
    let height: CGFloat
    let buttonName: String
    let fontSize: CGFloat
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination.navigationBarHidden(true)) {
            ZStack {
                // Background
                Rectangle()
                    .fill(Color.black)
                    .frame(width: width, height: height)
                    .cornerRadius(15)
                // Text
                Text(buttonName)
                    .font(.custom("GTWalsheimTrial-Md", size: fontSize))
                    .colorInvert()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationView {
        ButtonView1(width: 150, height: 50, buttonName: "Button", fontSize: 20, destination: Text("Destination View"))
    }
}

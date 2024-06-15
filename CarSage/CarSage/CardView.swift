//
//  CardView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Content")
                .padding()
        }
        .frame(width: 200, height: 300)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


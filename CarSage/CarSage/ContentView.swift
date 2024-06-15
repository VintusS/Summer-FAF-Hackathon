//
//  ContentView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Here")
                .font(.custom("GTWalsheimTrial-Bd", size: 20))
            Text("Haha")
                .font(.custom("GTWalsheimTrial-Rg", size: 16))
        }
    }
    init () {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
}

#Preview {
    ContentView()
}

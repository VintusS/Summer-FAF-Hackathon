//
//  ButtonView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct ButtonView: View {
    let width: CGFloat
    let height: CGFloat
    let buttonName: String
    let fontSize: CGFloat
    var body: some View {
        ZStack {
            //backgroung
            Rectangle()
                .fill(.black)
                .frame(width: width, height: height)
                .cornerRadius(15)
            //text
            Text(buttonName)
                .font(.custom("GTWalsheimTrial-Md", size: fontSize))
                .colorInvert()
        }
    }
}

#Preview {
    ButtonView(width: 150, height: 50, buttonName: "Button", fontSize: 20)
}

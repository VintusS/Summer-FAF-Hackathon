//
//  CardView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    HStack {
                        ImageView(imageUrl: "https://i.pinimg.com/originals/5d/45/15/5d4515bc04668518ac28000947d0e3bc.png", width: 30, height: 25)
                        Text("Mazda MX-5")
                            .font(.custom("GTWalsheimTrial-Bd", size: 18))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        ImageView(imageUrl: "https://icons.veryicon.com/png/o/miscellaneous/template-4/make-money.png", width: 30, height: 30)
                        Text("40,000")
                            .font(.custom("GTWalsheimTrial-Rg", size: 16))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        ButtonView(width: 100, height: 36, buttonName: "See Details", fontSize: 16)
                            .padding(.trailing, 8)
                        LikeButtonView(width: 25, height: 25)
                        Spacer()
                    }
                    
                }
            }
            HStack {
                Spacer()
                ImageView(imageUrl: "https://mazda-brochures.com/main/mazdamx5/2024/1/en-gb/assets/images/mazda-mx5-exclusive-line-rf-1.jpg", width: 150, height: 100)
            }
        }
        .padding()
        .frame(width: 350, height: 180)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    CardView()
}

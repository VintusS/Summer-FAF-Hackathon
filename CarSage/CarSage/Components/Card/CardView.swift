//
//  CardView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            HStack {
                VStack {
                    HStack {
                        ImageView(imageUrl: card.imageUrl, width: 30, height: 25)
                        Text(card.modelName)
                            .font(.custom("GTWalsheimTrial-Bd", size: 18))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        ImageView(imageUrl: "https://icons.veryicon.com/png/o/miscellaneous/template-4/make-money.png", width: 30, height: 30)
                        Text(card.price)
                            .font(.custom("GTWalsheimTrial-Rg", size: 16))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        ButtonView(
                            width: 100,
                            height: 36,
                            buttonName: "See Details",
                            fontSize: 16,
                            destination: CardDetailView(
                                carLogo: ImageView(imageUrl: card.imageUrl, width: 30, height: 25),
                                modelName: card.modelName,
                                description: card.details,
                                numberOfSeats: 2,
                                numberOfDoors: 2,
                                horsePower: 181,
                                numberOfSpeeds: 6,
                                baggageVolume: 130,
                                card: card
                            )
                        )
                        .padding(.trailing, 8)
                        LikeButtonView(width: 25, height: 25, card: card)
                        Spacer()
                    }
                }
            }
            HStack {
                Spacer()
                Image("Mazda1")
                    .frame(width: 170, height: 70)
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
    CardView(card: Card(
        id: UUID(),
        imageUrl: "https://i.pinimg.com/originals/5d/45/15/5d4515bc04668518ac28000947d0e3bc.png",
        modelName: "Mazda MX-5",
        price: "40,000",
        details: """
The Mazda MX-5 is a lightweight two-passenger roadster manufactured and marketed by Mazda with a front mid-engine, rear-wheel-drive layout. Manufactured at Mazda's Hiroshima plant, the MX-5 debuted in 1989 at the Chicago Auto Show and has been considered by many as one of the best driving cars ever made. Known for its fun-to-drive character, precise steering, and balanced handling, the MX-5 continues to be a popular choice for driving enthusiasts. The latest generation features a sleek design, advanced technology, and improved performance, making it a perfect choice for those seeking an exhilarating driving experience.
"""
    ))
}


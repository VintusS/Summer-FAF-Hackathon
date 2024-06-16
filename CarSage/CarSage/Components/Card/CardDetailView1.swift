//
//  SwiftUIView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct CardDetailView1<LogoView: View>: View {
    let carLogo: LogoView
    let modelName: String
    let description: String
    let numberOfSeats: Int
    let numberOfDoors: Int
    let horsePower: Int
    let numberOfSpeeds: Int
    let baggageVolume: Int
    let card: Card

    @State private var currentImageIndex: Int = 0
    @State private var isExpanded: Bool = false
    @State private var navigateToExplore: Bool = false
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var images: [Image] {
        let baseName = card.modelName.components(separatedBy: " ").first ?? "Image"
        return (1...4).map { Image("\(baseName)\($0)") }
    }

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Button(action: {
                        navigateToExplore = true
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .padding(8)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    }
                    Spacer()
                    Button(action: {
                        // Share button action
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .padding(8)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    }
                }
                .padding([.horizontal, .top])
                
                VStack {
                    // Content omitted for brevity
                }
                HStack {
                    carLogo
                    Text(modelName)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    LikeButtonView(width: 30, height: 30, card: card)
                }
                .padding([.horizontal, .top])
                .padding(.trailing, 10)
                
                TabView(selection: $currentImageIndex) {
                    ForEach(images.indices, id: \.self) { index in
                        images[index]
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .clipped()
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer) { _ in
                    withAnimation {
                        currentImageIndex = (currentImageIndex + 1) % images.count
                    }
                }
                
                HStack {
                    Text("Overview")
                        .font(.custom("GTWalsheimTrial-Md", size: 25))
                    Spacer()
                }
                .padding(.horizontal)
                
                Group {
                    if isExpanded {
                        Text(description)
                            .font(.custom("GTWalsheimTrial-Lt", size: 20))
                            .padding([.horizontal, .top])
                            .onTapGesture {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }
                    } else {
                        ExpandableText(description, lineLimit: 4)
                            .padding([.horizontal, .top])
                    }
                }
                HStack {
                    Text("Specs")
                        .font(.custom("GTWalsheimTrial-Md", size: 25))
                    Spacer()
                }
                .padding([.horizontal, .top])
                
                HStack(spacing: 20) {
                    SpecView(iconName: "person.2.fill", label: "Seats", value: "\(numberOfSeats)")
                    SpecView(iconName: "car.fill", label: "Doors", value: "\(numberOfDoors)")
                    SpecView(iconName: "speedometer", label: "HP", value: "\(horsePower)")
                    SpecView(iconName: "gear", label: "Gears", value: "\(numberOfSpeeds)")
                    SpecView(iconName: "bag.fill", label: "Volume", value: "\(baggageVolume)L")
                }
                .padding(.horizontal)
                
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    callPhoneNumber(phoneNumber: "078122744")
                }) {
                    Text("Contact Seller")
                        .font(.custom("GTWalsheimTrial-Rg", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
                Button(action: {
                    // Button action
                }) {
                    Text("Compare")
                        .font(.custom("GTWalsheimTrial-Rg", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .background(Color(hex: "#f3f3f3"))
        .navigationBarHidden(true)
        .background(
            NavigationLink(destination: Results().navigationBarHidden(true), isActive: $navigateToExplore) { EmptyView() }
        )
    }
    
    private func callPhoneNumber(phoneNumber: String) {
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            if UIApplication.shared.canOpenURL(phoneCallURL) {
                UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
            } else {
                print("Can't call the caller")
            }
        }
    }
}

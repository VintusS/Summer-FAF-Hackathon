//
// CardDetailView.swift
// CarSage
//
// Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct CardDetailView<LogoView: View>: View {
    let carLogo: LogoView
    let modelName: String
    let description: String
    let numberOfSeats: Int
    let numberOfDoors: Int
    let horsePower: Int
    let numberOfSpeeds: Int
    let baggageVolume: Int

    @State private var currentImageIndex: Int = 0
    @State private var isExpanded: Bool = false
    @State private var navigateToExplore: Bool = false // State variable to control navigation
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    let images = [
        Image("Mazda1"),
        Image("Mazda2"),
        Image("Mazda3"),
        Image("Mazda4")
    ]

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Button(action: {
                        navigateToExplore = true // Set the state variable to true to trigger navigation
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
                    LikeButtonView(width: 30, height: 30)
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
            NavigationLink(destination: ExploreView().navigationBarHidden(true), isActive: $navigateToExplore) { EmptyView() } // NavigationLink to ExploreView
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

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(
            carLogo: ImageView(imageUrl: "https://i.pinimg.com/originals/5d/45/15/5d4515bc04668518ac28000947d0e3bc.png", width: 30, height: 25),
            modelName: "MX-5",
            description: """
The Mazda MX-5 is a lightweight two-passenger roadster manufactured and marketed by Mazda with a front mid-engine, rear-wheel-drive layout. Manufactured at Mazda's Hiroshima plant, the MX-5 debuted in 1989 at the Chicago Auto Show and has been considered by many as one of the best driving cars ever made. Known for its fun-to-drive character, precise steering, and balanced handling, the MX-5 continues to be a popular choice for driving enthusiasts. The latest generation features a sleek design, advanced technology, and improved performance, making it a perfect choice for those seeking an exhilarating driving experience.
""",
            numberOfSeats: 2,
            numberOfDoors: 2,
            horsePower: 181,
            numberOfSpeeds: 6,
            baggageVolume: 130
        )
    }
}

struct SpecView: View {
    let iconName: String
    let label: String
    let value: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 30))
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            Text(label)
                .font(.custom("GTWalsheimTrial-Lt", size: 15))
            Text(value)
                .font(.custom("GTWalsheimTrial-Md", size: 15))
        }
    }
}

//
//  ExploreView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct ExploreView: View {
    let cars = loadCars()

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Suggested Cars")
                            .font(.custom("GTWalsheimTrial-Md", size: 30))
                        Text("Latest Recommendations")
                            .font(.custom("GTWalsheimTrial-Lt", size: 15))
                        ForEach(cars) { car in
                            CardView(card: car)
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

struct FloatingFooterMenu: View {
    var body: some View {
        HStack {
            Spacer()
            FooterMenuItem(
                title: "Explore",
                customIcon: AnyView(
                    HStack(spacing: 2) {
                        VStack(spacing: 2) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 10, height: 10)
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 10, height: 10)
                        }
                        VStack(spacing: 2) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 10, height: 10)
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 10, height: 10)
                        }
                    }
                    .foregroundColor(.black)
                ),
                destination: AnyView(ExploreView().navigationBarHidden(true))
            )
            Spacer()
            Spacer()
            FooterMenuItem(iconName: "magnifyingglass", title: "Search", destination: AnyView(SearchView().navigationBarHidden(true)))
            Spacer()
            Spacer()
            FooterMenuItem(iconName: "bookmark", title: "Saved", destination: AnyView(SavedCardView().navigationBarHidden(true)))
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        .frame(height: 60)
    }
}

struct FooterMenuItem: View {
    let iconName: String?
    let title: String
    let customIcon: AnyView?
    let destination: AnyView

    init(iconName: String? = nil, title: String, customIcon: AnyView? = nil, destination: AnyView) {
        self.iconName = iconName
        self.title = title
        self.customIcon = customIcon
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 4) {
                if let customIcon = customIcon {
                    customIcon
                } else if let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                Text(title)
                    .font(.custom("GTWalsheimTrial-Bd", size: 12))
                    .foregroundColor(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

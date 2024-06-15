//
//  ExploreView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            // Your main content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Example content
                    ForEach(0..<20) { i in
                        CardView()
                    }
                }
                .padding(.top, 20)
            }
            .background(Color(hex: "#f3f3f3"))
            
            VStack {
                Spacer()
                HStack {
                    FloatingFooterMenu()
                }
                .padding(.horizontal, 30)
            }
        }
        .background(Color(hex: "#f3f3f3"))
    }
}

struct FloatingFooterMenu: View {
    var body: some View {
        HStack {
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
                )
            )
            Spacer()
            FooterMenuItem(iconName: "magnifyingglass", title: "Search")
            Spacer()
            FooterMenuItem(iconName: "bookmark", title: "Saved")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
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

    init(iconName: String? = nil, title: String, customIcon: AnyView? = nil) {
        self.iconName = iconName
        self.title = title
        self.customIcon = customIcon
    }

    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

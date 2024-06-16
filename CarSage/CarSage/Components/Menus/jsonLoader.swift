//
//  jsonLoader.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import Foundation

//struct Card: Identifiable, Codable {
//    let id: String
//    let logoUrl: String
//    let imageName: String
//    let modelName: String
//    let price: String
//    let details: String
//}

func loadResults() -> [Card] {
    guard let url = Bundle.main.url(forResource: "Results", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let cars = try? JSONDecoder().decode([Card].self, from: data) else {
        return []
    }
    return cars
}

//
//  SurveyData.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI
import Foundation

struct SurveyData: Codable {
    let question: String
    let subheading: String
    let answers: [String]
    let multipleChoice: Bool
    let isLast: Bool
}

func loadSurveyData() -> SurveyData? {
    if let url = Bundle.main.url(forResource: "Survey", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let surveyData = try decoder.decode(SurveyData.self, from: data)
            return surveyData
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    return nil
}


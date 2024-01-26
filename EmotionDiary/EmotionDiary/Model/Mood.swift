//
//  Mood.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/1/24.
//


/*
 CaseIterable
 ->
 Mood로 선언된 모든 Case에 대해서 돌면서 표현할 수 있다.라는 의미
 */


import Foundation

enum Mood: String, Codable, CaseIterable {
    case bad
    case notGreat
    case okay
    case good
    case great
    
    var imageName: String {
        switch self  {
        case .bad: return "cloud.bolt.rain.fill"
        case .notGreat: return "cloud.heavyrain.fill"
        case .okay: return "cloud.fill"
        case .good: return "cloud.sun.fill"
        case .great: return "sun.max.fill"
        }
    }
    
    var name: String {
        switch self  {
        case .bad: return "Bad"
        case .notGreat: return "Not\nGreat"
        case .okay: return "Okay"
        case .good: return "Good"
        case .great: return "Great"
        }
    }
    
}

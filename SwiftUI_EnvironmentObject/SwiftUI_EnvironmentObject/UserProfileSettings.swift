//
//  UserProfileSettings.swift
//  SwiftUI_EnvironmentObject
//
//  Created by 김우섭 on 12/21/23.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}

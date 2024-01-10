//
//  CoffeMenu.swift
//  Cafe
//
//  Created by 김우섭 on 1/9/24.
//

import SwiftUI

struct CoffeMenu: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
    
    static let sapmle: [CoffeMenu] = [
        CoffeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeMenu(image: Image("coffee"), name: "카페라뗴"),
        CoffeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeMenu(image: Image("coffee"), name: "아이스 드립커피")
    ]
}

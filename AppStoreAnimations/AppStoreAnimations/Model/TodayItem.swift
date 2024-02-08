//
//  TodayItem.swift
//  AppStoreAnimations
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct TodayItem: Identifiable {
    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var contentImage: String
    var logo: String
}
    
var items = [
        TodayItem(title: "Forza Street", category: "Ultimate Street Racing Game", overlay: "GAME OF THE DAY", contentImage: "1", logo: "2"),
        TodayItem(title: "Roblox", category: "Adventure", overlay: "Li Nas X Performs InRoblox", contentImage: "1", logo: "2")
]

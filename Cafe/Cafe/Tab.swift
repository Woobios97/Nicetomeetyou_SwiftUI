//
//  Tab.swift
//  Cafe
//
//  Created by 김우섭 on 1/8/24.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    // associated Value
    var textItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}

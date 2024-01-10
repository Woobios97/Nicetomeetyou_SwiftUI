//
//  MainTabView.swift
//  Cafe
//
//  Created by 김우섭 on 1/9/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.textItem
                }
            
            Text("Other")
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.textItem
                }
        }
    }
}

#Preview {
    MainTabView()
}

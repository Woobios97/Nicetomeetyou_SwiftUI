//
//  TabBar.swift
//  AppStoreAnimations
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            Today()
                .tabItem {
                    Image(systemName: "doc.text.image")
                        .renderingMode(.template)
                    Text("Today")
                    
                }
            Text("Games")
                .tabItem {
                    Image(systemName: "gamecontroller")
                        .renderingMode(.template)
                    
                    Text("Games")
                }
            
            Text("Apps")
                .tabItem {
                    Image(systemName: "app.gift")
                        .renderingMode(.template)
                    
                    Text("Apps")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                    
                    Text("Search")
                }
        }
    }
}

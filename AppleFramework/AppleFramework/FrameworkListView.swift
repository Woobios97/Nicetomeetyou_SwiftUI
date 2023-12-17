//
//  ContentView.swift
//  AppleFramework
//
//  Created by 김우섭 on 12/17/23.
//

import SwiftUI

struct FrameworkListView: View {
    
    @State var list: [AppleFramework] = AppleFramework.list
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.adaptive(minimum: 70, maximum: 100))
    ]
    
    var body: some View {
        
        // Grid 만들기
        // - UIKit : UICollectionView
        //   - Data, Presentaion, Layout
        // - SwiftUI : LazyVGrid, LazyHGrid
        //   - ✅ Data, ✅ Presentaion, ✅ Layout
        
        NavigationView {
            ScrollView {
//                LazyHGrid(rows: layout) {
//                    ForEach(list) { item in
//                        FrameworkCell(framework: item)
//                    }
//                }
                
                LazyVGrid(columns: layout) {
                    ForEach(list) { item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}

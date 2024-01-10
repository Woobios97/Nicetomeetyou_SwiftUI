//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by 김우섭 on 1/9/24.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack {
                ForEach(CoffeMenu.sapmle) { meun in
                    MenuSuggestionItemView(coffeeMenu: meun)
                }
            }
        }
    }
}

struct MenuSuggestionItemView: View {
    let coffeeMenu: CoffeMenu
    
    var body: some View {
        VStack {
            coffeeMenu.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            
            Text(coffeeMenu.name)
                .font(.caption)
        }
    }
}

#Preview {
    MenuSuggestionSectionView()
}

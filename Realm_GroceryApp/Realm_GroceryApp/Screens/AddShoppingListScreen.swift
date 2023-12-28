//
//  AddShoppingListScreen.swift
//  Realm_GroceryApp
//
//  Created by 김우섭 on 12/29/23.
//

import SwiftUI
import RealmSwift

struct AddShoppingListScreen: View {
    
    @State private var title: String = ""
    @State private var address: String = ""
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter address", text: $address)
                
                Button {
                    // 쇼핑 목록 생성
                    let shoppingList = ShoppingList()
                    shoppingList.title = title
                    shoppingList.address = address
                    $shoppingLists.append(shoppingList)
                    
                    dismiss()
                    
                } label: {
                    Text("save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.bordered)
            }
            
            .navigationTitle("New List")
        }
    }
}

#Preview {
    AddShoppingListScreen()
}

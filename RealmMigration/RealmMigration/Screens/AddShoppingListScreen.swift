//
//  AddShoppingListScreen.swift
//  RealmMigration
//
//  Created by woosub kim  on 1/9/24.
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
                TextField("타이틀을 입력하세요", text: $title)
                TextField("주소를 입력하세요", text: $address)
                
                Button {
                    
                    // 쇼핑 리스트 저장하기
                    let shoppingList = ShoppingList()
                    shoppingList.title = title
                    shoppingList.adress = address
                    $shoppingLists.append(shoppingList)
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.bordered)
            }
            .navigationTitle("새로운 리스트")
        }
    }
}

#Preview {
    AddShoppingListScreen()
}

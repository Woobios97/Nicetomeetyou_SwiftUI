//
//  ContentView.swift
//  Realm_GroceryApp
//
//  Created by 김우섭 on 12/29/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if shoppingLists.isEmpty {
                    Spacer()
                    Text("No shopping lists!")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) { ShoppingList in
                        VStack(alignment: .leading) {
                            Text(ShoppingList.title)
                            Text(ShoppingList.address)
                                .opacity(0.4)
                        }
                        
                    }.onDelete(perform: $shoppingLists.remove)
                }
                
                    .navigationTitle("Grocery App")
            }
            .sheet(isPresented: $isPresented, content: {
                AddShoppingListScreen()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

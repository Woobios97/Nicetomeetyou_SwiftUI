//
//  ContentView.swift
//  RealmMigration
//
//  Created by woosub kim  on 1/9/24.
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
                    Text("No shopping lists!")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) { shoppingList in
                        VStack(alignment: .leading) {
                            Text(shoppingList.title)
                            Text(shoppingList.adress)
                                .opacity(0.4)
                        }
                    }
                    .onDelete(perform: $shoppingLists.remove)
                }
                
                    .navigationTitle("Grocery APP")
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

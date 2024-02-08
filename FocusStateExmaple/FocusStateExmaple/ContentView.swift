//
//  ContentView.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/24/24.
//

import SwiftUI

struct ContentView: View {
//    @State private var checkAmount = 0.0
//    @FocusState private var amountIsFocused: Bool
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "KR"))
//                        .keyboardType(.decimalPad)
//                        .focused($amountIsFocused)
//                }
//            }
//            .toolbar(content: {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Done") {
//                        amountIsFocused = false
//                    }
//                }
//            })
//        }
//    }
    
    
    var body: some View {
        TabView {
            VStack {
                EmptyView()
            }
            .tabItem {
                Text("기본검색")
            }
            VStack {
                ToastBasicView()
            }
            .tabItem {
                Text("토스트")
            }
            VStack {
                EmptyView()
            }
            .tabItem {
                Text("연습")
            }
            .padding()
            .tabItem {
                Text("커스텀검색")
            }
        }
    }
}


#Preview {
    ContentView()
}

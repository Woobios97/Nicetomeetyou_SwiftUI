//
//  NavigationStackBootCamp.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct NavigationViewBootCamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(0..<10) { x in
                        NavigationLink(destination: {
                            MySecondScreen(value: x)
                        }, label: {
                            Text("Click me: \(x)")
                        })
                    }
                    .navigationTitle("Nav BootCapm")
                }
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("Init screen: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavigationViewBootCamp()
}

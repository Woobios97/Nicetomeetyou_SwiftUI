//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                ImageView()
                ButtonView()
                TextView()
            
            Spacer()
            
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            
            Spacer()
            
            ZStack {
                ImageView()
                ButtonView()
                TextView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

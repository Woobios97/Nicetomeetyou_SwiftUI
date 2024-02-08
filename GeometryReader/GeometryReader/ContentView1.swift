//
//  ContentView.swift
//  GeometryReader
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        VStack {
            Text("Left Text")
            RightView()
        }
    }
}

struct RightView: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .path(in: CGRect(x: geometry.size.width/2, y: 0, width: geometry.size.width/2.0, height: geometry.size.width/2.0))
                .fill(Color.green)
        }
    }
}

#Preview {
    ContentView1()
}

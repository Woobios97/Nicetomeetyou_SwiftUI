//
//  SwiftUIView1.swift
//  GeometryReader
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct SwiftUIView1: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("\(geometry.safeAreaInsets.top)")
                    .background(Color.yellow)
//                    .ignoresSafeArea()
                Text("\(geometry.safeAreaInsets.top)")
                    .background(Color.green)
//                    .ignoresSafeArea()
                LeftView()
//                    .ignoresSafeArea()
            }
        }
    }
}

struct LeftView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .overlay(Text("\(geometry.safeAreaInsets.bottom)"))
            }
        }
    }
}


#Preview {
    SwiftUIView1()
}

//
//  ContentView.swift
//  lottieSplashScreen
//
//  Created by woosub kim  on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isContentReady : Bool = false
    
    var body: some View {
        
        ZStack {
            
                Text("Hello world!")
                    .padding()
            if !isContentReady {
                LottieView()
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                    .transition(.opacity)
            }
        }
        .onAppear {
            print("ContentView - onAppear called")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.45, execute: {
                print("ContentView - 1.25뷰")
                withAnimation { isContentReady.toggle() }
            })
        }
        
    }
}

// 스플래쉬 스크린
extension ContentView {
    var mySplashScreenView: some View {
        Color.yellow.edgesIgnoringSafeArea(.all)
            .overlay(alignment: .center) {
                Text("스플래쉬입니다.")
                    .font(.largeTitle)
            }
    }
}

#Preview {
    ContentView()
}

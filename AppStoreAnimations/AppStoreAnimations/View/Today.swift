//
//  Today.swift
//  AppStoreAnimations
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct Today: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("2월 2번째 토요일")
                            .foregroundColor(.gray)
                        
                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    }
                }
                .padding()
                
                ForEach(items) { item in
                    // cardView
                }
            }
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}

//
//  CardView.swift
//  AppStoreAnimations
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct CardView: View {
    var item: TodayItem
    
    var body: some View {
        VStack {
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            
            HStack {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {}) {
                        Text("Get")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                        
                        Text("In App Purchase")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

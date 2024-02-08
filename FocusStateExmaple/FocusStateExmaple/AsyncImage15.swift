//
//  AsyncImage15.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/26/24.
//

import SwiftUI

struct AsyncImage15: View {
    
    private let imageName: String = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FlI00H%2FbtqXQ6wtwVP%2FUrgHPkbHKxeqWwHIYzoaK1%2Fimg.png"
    
    var body: some View {
        AsyncImage(url: URL(string: imageName), transaction: Transaction(animation: .spring(response: 0.7, dampingFraction: 0.3, blendDuration: 0.5))) { phase in
            switch phase {
            case .success(let image):
                image
                    .ImageModifier()
                    .transition(.move(edge: .bottom))
                
            case .failure(let error):
                VStack {
                    Image(systemName: "photo.circle.fill")
                        .IconModifier()
                    Text("에러 코드 : \(error.localizedDescription)")
                        .padding()
                        .lineLimit(3)
                }
                
            case .empty:
                Image(systemName: "photo.circle.fill")
                    .IconModifier()
                
            @unknown default:
                ProgressView()
            }
        }
        
    }
}

#Preview {
    AsyncImage15()
}

extension Image {
    func ImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func IconModifier() -> some View {
        self
            .ImageModifier()
            .frame(maxWidth: 200)
            .foregroundColor(.blue.opacity(0.6))
    }
}


                   //        AsyncImage(url: URL(string: imageName)) { image in
                   //            image
                   //                .ImageModifier()
                   //        } placeholder: {
                   //            Image(systemName: "trash")
                   //                .resizable()
                   //                .scaledToFit()
                   //                .frame(width: 200)
                   //                .foregroundColor(.blue.opacity(0.6))
                   //        }
                   //        .padding(20)

//
//  ImageLoaderView.swift
//  SwiftfulSwiftUilnPractice
//
//  Created by 김우섭 on 9/29/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
  let urlString: String
  let resizingMode: ContentMode = .fill

  var body: some View {
    Rectangle()
      .opacity(0.001)
      .overlay(
        WebImage(url: URL(string: urlString))
          .resizable()
          .indicator(.activity)
          .aspectRatio(contentMode: resizingMode)
          .allowsTightening(false)
      )
      .clipped()
  }
}

#Preview {
  ImageLoaderView(urlString: Constants.randomImage)
    .cornerRadius(30)
    .padding(40)
    .padding(.vertical, 60)
}

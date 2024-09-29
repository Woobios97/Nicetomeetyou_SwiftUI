//
//  ContentView.swift
//  SwiftfulSwiftUilnPractice
//
//  Created by 김우섭 on 9/29/24.
//

import SwiftUI

struct ContentView: View {

  @State private var users: [User] = []
  @State private var products: [Product] = []

  var body: some View {
    ScrollView {
      VStack {
//        ForEach(users) { users in
//          Text(users.firstName)
//        }

        ForEach(products) { products in
          Text(products.title)
        }
      }
    }
    .padding()
    .task {
      await getData()
    }
  }

  private func getData() async {
    do {
      users = try await DatabaseHelper().getUsers()
      products = try await DatabaseHelper().getProducts()
    } catch {

    }
  }

}

#Preview {
  ContentView()
}

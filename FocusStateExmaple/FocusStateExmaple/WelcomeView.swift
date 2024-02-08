//
//  LoginView2.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct WelcomeView: View {
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusField: Field?
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusField, equals: .username)
            
            SecureField("Password", text: $password)
                .focused($focusField, equals: .password)
            
            Button("Sign In") {
                if username.isEmpty {
                    focusField = .username
                } else if password.isEmpty {
                    focusField = .password
                } else {
//                    handleLogin(username, password) -> 로그인 처리로직 🔐
                }
            }
        }
        .onAppear {
            focusField = .username
        }
    }
}

#Preview {
    WelcomeView()
}

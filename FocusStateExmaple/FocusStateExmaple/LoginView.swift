//
//  LoginView.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var name: String = ""
    @State var password = ""
    @FocusState var focusField: Field?
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .focused($focusField, equals: .name)
                .onSubmit {
                    focusField = .password
                }
                .keyboardType(.namePhonePad)
            TextField("Password", text: $password)
                .focused($focusField, equals: .password)
                .onSubmit {
                    checkTextFiled()
                }
            Button("Login") {
                checkTextFiled()
            }
        }
        .onAppear {
            focusField = .name
        }
    }
    
    
    private func checkTextFiled() {
        if name.isEmpty {
            focusField = .name
        } else if password.isEmpty {
            focusField = .password
        } else {
            focusField = nil
            // 로그인 처리 로직 🔐
        }
    }
}

enum Field: Hashable {
    case name
    case password
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



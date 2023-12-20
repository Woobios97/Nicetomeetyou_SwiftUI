//
//  SecondView.swift
//  SwiftUI_EnvironmentObject
//
//  Created by 김우섭 on 12/21/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack(spacing: 30) {
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }

        }
        .navigationTitle("Second View")
    }
}

#Preview {
    SecondView()
}

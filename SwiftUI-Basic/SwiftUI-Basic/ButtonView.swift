//
//  ButtonView.swift
//  SwiftUI-Basic
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("버튼 클릭")
        } label: {
            Text("Clik Me")
                .font(.system(size: 20, weight: .bold, design: .default)).foregroundStyle(.white)
        }
        .padding()
        .frame(height: 110.0)
        .background(.purple)
        .cornerRadius(20)
        .opacity(0.8)
    }
}

#Preview {
    ButtonView()
}

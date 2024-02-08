//
//  PhoneNumber.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct PhoneNumber: View {
    var body: some View {
        GroupBox(label: Text("휴대전화"), content: {
            HStack {
                Text("010-4444-2111")
                Spacer()
            }
            
                .shadow(radius: 20)
            
                
        })
        .padding()
//        .frame(width: 200, height: 200, alignment: .leading)
        
    }
}

#Preview {
    PhoneNumber()
}

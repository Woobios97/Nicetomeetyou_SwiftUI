//
//  TextView.swift
//  SwiftUI-Basic
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        
        HStack {
            Text("SwiftUI")
                .font(.system(size: 40, weight: .bold, design: .default))
            
            Spacer() // Spacer() -> 빈 공간을 채워넣는 용도
        }
        
        
    }
}

#Preview {
    TextView()
}

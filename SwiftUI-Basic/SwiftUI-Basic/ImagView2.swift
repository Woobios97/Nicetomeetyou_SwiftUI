//
//  ImagView2.swift
//  SwiftUI-Basic
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct ImagView2: View {
    var body: some View {
        HStack {
            Text("Left")
            Spacer() // 이 Spacer는 왼쪽 텍스트와 오른쪽 텍스트 사이를 밀어냅니다.
            Text("Right")
        }
        .padding() // HStack에 패딩을 추가합니다.
    }
}

#Preview {
    ImagView2()
}

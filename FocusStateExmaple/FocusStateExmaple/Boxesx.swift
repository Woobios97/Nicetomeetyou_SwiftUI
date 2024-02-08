//
//  Boxesx.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct Boxesx: View {
    @State var userAgreed = false
    
    var agreementText: String =
    """
다음 예제에서는 최종 사용자 계약이라는 레이블이 있는 그룹 상자를 설정하고, 스크롤 뷰로 감싸는 텍스트 뷰에 긴 agreementText 문자열을 설정합니다. 이 상자에는 사용자가 텍스트를 읽은 후 상호 작용할 수 있는 Toggle도 포함되어 있습니다.
다음 예제에서는 최종 사용자 계약이라는 레이블이 있는 그룹 상자를 설정하고, 스크롤 뷰로 감싸는 텍스트 뷰에 긴 agreementText 문자열을 설정합니다. 이 상자에는 사용자가 텍스트를 읽은 후 상호 작용할 수 있는 Toggle도 포함되어 있습니다.
다음 예제에서는 최종 사용자 계약이라는 레이블이 있는 그룹 상자를 설정하고, 스크롤 뷰로 감싸는 텍스트 뷰에 긴 agreementText 문자열을 설정합니다. 이 상자에는 사용자가 텍스트를 읽은 후 상호 작용할 수 있는 Toggle도 포함되어 있습니다.
"""
    
    var body: some View {
        GroupBox(label:
                    Label("End-User Agreement", systemImage: "building.columns")
        ) {
            ScrollView(.vertical, showsIndicators: true) {
                Text(agreementText)
                    .font(.footnote)
            }
            .frame(height: 100)
            Toggle(isOn: $userAgreed) {
                Text("I agree to the above terms")
            }
        }
    }
}

#Preview {
    Boxesx()
}

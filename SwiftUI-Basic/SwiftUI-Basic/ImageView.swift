//
//  ImageView.swift
//  SwiftUI-Basic
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "sun.max.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ImageView()
}

/*
 .aspectRatio(contentMode: .fit) modifier를 하고나서 반환된 값이 view이다.
 image -> image에 imagemodifier를 쓰고, 반환된 값이 image이다. -> image , imageModifier를 써서 나온 값이 view이면 -> View Md를 쓰면 되는데,
 image md view -> image md image /
 구체적인 것을 먼저 modifier를 적용하고 나중에 일반적인 modifier를 적용한다.
 modifier가 타입 별로 있기 때문에, 타입에 맞게 조합해서 써야한다.
*/

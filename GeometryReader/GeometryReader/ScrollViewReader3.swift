//
//  goeppq1.swift
//  GeometryReader
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct goeppq1: View {
    @Namespace var topID
    @Namespace var bottomID
    @State var isTapped: Bool = false
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll To Bottom") {
                    withAnimation {
                        isTapped.toggle()
                        // 스크롤 이동을 지연시키는 코드 추가
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            proxy.scrollTo(bottomID, anchor: .bottom)
                        }
                    }
                }
                .id(topID)
                VStack(spacing: 0) {
                    ForEach(0..<100, id: \.self) { i in
                        color(fraction: Double(i) / 100)
                            .frame(height: 32)
                        if isTapped {
                            VStack {
                                Text("이상")
                                Text("상이")
                                Text("상어")
                            }
                        }
                    }
                }
                Button("Top") {
                    withAnimation {
                        // 여기서도 동일한 지연 방식을 적용할 수 있음
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            proxy.scrollTo(topID, anchor: .top)
                        }
                    }
                }
                .id(bottomID)
            }
        }
    }
    
    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}

struct goeppq1_Previews: PreviewProvider {
    static var previews: some View {
        goeppq1()
    }
}

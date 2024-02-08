//
//  ScrollViewReader4.swift
//  GeometryReader
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

struct ScrollViewReader4: View {
    
    private let target: Int = 100
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ForEach(1..<200) { num in
                    Text("\(num)")
                        .font(.title)
                        .foregroundStyle(num == target ? .blue : .orange)
                        .background(
                        RoundedRectangle(cornerRadius: 50)
                            .fill(num == target ? .red.opacity(0.5) : .clear)
                            .frame(width: 360)
                        )
                        .id(num)    // 이동할 대상에 id를 할당한다.
                }
                .frame(maxWidth: .infinity)
            }
            .overlay(alignment: .bottomTrailing) {
                VStack(spacing: 20) {
                    Button {
                        withAnimation {
                            proxy.scrollTo(target, anchor: .top)
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.green.opacity(0.8))
                            .frame(width: 100, height: 80)
                            .overlay {
                                Text("anchor: \n'top'")
                            }
                            .padding([.bottom, .trailing], 20)
                    }
                    
                    Button {
                        withAnimation {
                            proxy.scrollTo(target, anchor: .center)
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.green.opacity(0.8))
                            .frame(width: 100, height: 80)
                            .overlay {
                                Text("anchor: \n'center'")
                            }
                            .padding([.bottom, .trailing], 20)
                    }
                    
                    Button {
                        withAnimation {
                            proxy.scrollTo(target, anchor: .bottom)
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.green.opacity(0.8))
                            .frame(width: 100, height: 80)
                            .overlay {
                                Text("anchor: \n'bottom'")
                            }
                            .padding([.bottom, .trailing], 20)
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    ScrollViewReader4()
}

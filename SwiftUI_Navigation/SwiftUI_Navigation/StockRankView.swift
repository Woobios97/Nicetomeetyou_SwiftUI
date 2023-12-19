//
//  SwiftUIView.swift
//  SwiftUI_Navigation
//
//  Created by 김우섭 on 12/19/23.
//

import SwiftUI

struct StockRankView: View {
    
    @State var list = StockModel.list
    
    /*
     NavigationView에서 클릭이 됐을 때, 그 정보를 가지고 상세뷰로 보내주고 싶을 때는
     NavigationLink를 쓰면 된다.
     NavigationLink를 크개 2가지를 구성해줘야된다.
     NavigationLink {
         StockDetailView(stock: $item) -> 1번
     } label: {
         EmptyView() -> 2번
     }
     1번 -> 클릭했을 때 타겟을 어디로 보낼 지?
     2번 -> 클릭하는 View에 버튼을 어떻게 꾸며줄 것인지?
     ZStack {
         NavigationLink {
             StockDetailView(stock: $item) -> 1번
         } label: {
             EmptyView() -> 2번
         }
         StockRankRow(stock: $item)
     }
     이 코드에서는 1번으로 타갯을 보내고, 2번에는 빈뷰를 했다.
     요구된 UI를 만들기위해서 그런 것이다.
     ZStack을 이용해서
     뒤에는 NavigationLink를 넣고
     앞에는 StockRankRow(stock: $item)를 넣음 으로써 UI를 깔끔하게 만들었다.
    */
    
    var body: some View {
        NavigationView {
            List($list) { $item in
                ZStack {
                    NavigationLink {
                        StockDetailView(stock: $item)
                    } label: {
                        EmptyView()
                    }
                    StockRankRow(stock: $item)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 80)
            }
            .listStyle(.plain)
            .navigationTitle("주식 리스트")
            .foregroundColor(.white)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
        .preferredColorScheme(.dark)
    }
}

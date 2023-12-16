//
//  ContentView.swift
//  StockRank
//
//  Created by 김우섭 on 12/17/23.
//

import SwiftUI

struct StockRankView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        
        List(list, id:\.self) { item in
            StockRankRow(stock: item)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .frame(height: 80)
        }
        .listStyle(.plain)
        .background(.black)
        
//        ScrollView {
//            ForEach(list, id:\.self) { stock in
//                StockRankRow(stock: stock)
//                    .frame(height: 80)
//            }
//        }
//        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}

/*
 SwiftUI에서도 List를 만들 때, 
 1. 각 셀을 어떻게 디자인할 것이냐?
 2. 디자인한 셀을 List로 사용할 때, List을 이용해서 셀을 받아오고, 거기서 하나씩 아이템을 돌면서
 어떻게 셀을 구성하겠다라고 정해주면 구성해준다.
 -> List같은 경우 재사용성도 고려되어있고, 디지안도 미리 정의되어 있기 때문에, 커스텀할 필요가 있다.
*/

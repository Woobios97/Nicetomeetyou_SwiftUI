//
//  StockRankView.swift
//  SwiftUI_StateObject_ObservedObject
//
//  Created by 김우섭 on 12/20/23.
//

import SwiftUI

struct StockRankView: View {
    
//    @State var list = StockModel.list
    
    @StateObject var vm = StockRankViewModel()
    
//    viewModel
//    - list
//    - favorite
    
    var body: some View {
        NavigationView {
            List($vm.models) { $item in
                ZStack {
                    NavigationLink {
                        StockDetailView(viewModel: vm, stock: $item)
                    } label: {
                        EmptyView()
                    }
                    StockRankRow(stock: $item)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 80)
            }
            .listStyle(.plain)
            .navigationTitle("Stock Rank")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
            .preferredColorScheme(.dark)
    }
}

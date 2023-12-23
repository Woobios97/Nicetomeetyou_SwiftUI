//
//  StockRankViewModel.swift
//  SwiftUI_StateObject_ObservedObject
//
//  Created by 김우섭 on 12/20/23.
//

import Foundation

/*
 StateObject, ObservedObject를 쓰기 위해서는 ObservableObject 프로토콜을 따라야한다.
*/

final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks = models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
    /*
     StockDetailView에 heart 버튼이 생길 텐데, 버튼이 생기면 Single of truth에서 전달받은 모델을 갖고있다.
     heartButton을 클릭하게 되면 StockRankView에서 들고 있는 $item을 넘겨주는 것인데, 그 item에 favorite속성이,
     StockDetailView에 heart 버튼을 클릭하게 되면, 이 favorite이 false에서 true 즉 토글이 될텐데, 그 Data가 다 viewModel인 StockRankViewModel에 대해서 바뀐다.
    */
}

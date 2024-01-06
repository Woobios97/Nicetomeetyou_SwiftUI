//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/1/24.
//

/*
 To-DO : Sequence -> Dictionary
 
 AS-IS
 [MoodDiary]
 
 TO-BE
 [String: [MoodDiary]]
 "2022-04" : [MoodDiary]
 "2022-05" : [MoodDiary]
 "2022-06" : [MoodDiary]
 "2022-07" : [MoodDiary]
*/

import Foundation
import Combine

final class DiaryListViewModel: ObservableObject {
    
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    // 데이터 파일에서 일기 리스트 가져오기
    // list에 해당 일기 객체들 세팅
    // list 세팅 되면, dic 도 세팅하기
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
    }
    
    var keys: [String] {
        // given : "2022-5" , "2022-4", "2022-6"
        // sorted : "2022-4", "2022-5", "2022-6"
        return dic.keys.sorted { $0 < $1 }
    }
    
    private func bind() {
        $list.sink { items in
            print("--> List Chaneged: \(items)")
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier })
            self.persist(items: items)
        }
        .store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
    
}

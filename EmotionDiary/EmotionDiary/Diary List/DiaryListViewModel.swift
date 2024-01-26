//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/1/24.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        // given : "2022-5" , "2022-4", "2022-6"
        // sorted : "2022-4", "2022-5", "2022-6"
        return dic.keys.sorted { $0 < $1 }
    }
}

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

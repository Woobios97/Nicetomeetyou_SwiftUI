//
//  EmotionDiaryApp.swift
//  EmotionDiary
//
//  Created by 김우섭 on 2022/07/02.
//

import SwiftUI

@main
struct EmotionDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = DiaryListViewModel()
            DiaryListView(vm: vm)
        }
    }
}

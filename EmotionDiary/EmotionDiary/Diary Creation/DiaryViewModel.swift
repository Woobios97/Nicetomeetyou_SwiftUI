//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/2/24.
//

import Foundation
import SwiftUI
import Combine

final class DiaryViewModel: ObservableObject {
    
    @Published var date: Date = Date()
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink { date in
            print("--> Selected: \(date)")
        }
        .store(in: &subscriptions)
    }
    
}

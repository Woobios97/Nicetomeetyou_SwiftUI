//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/1/24.
//

import SwiftUI

/*
새로 생성 버튼 -> 날짜 입력 -> 감정 입력 -> 일기 내용 입력 -> 저장
*/

/*
DiaryDateInputView의
일기를 쓸 날짜를 픽할 수 있게 하는 것이 목적
*/

struct DiaryDateInputView: View {
    
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $vm.date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        }
        
        
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false))
        DiaryDateInputView(vm: vm)
    }
}

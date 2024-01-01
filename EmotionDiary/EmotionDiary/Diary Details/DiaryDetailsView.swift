//
//  DiaryDetailsView.swift
//  EmotionDiary
//
//  Created by 김우섭 on 1/1/24.
//

import SwiftUI

struct DiaryDetailsView: View {
    
    /*
     라이트모드에서는 텍스트를 검은색으로,
     다크모드에서는 텍스트틀 흰색으로 바꿀 수 있게끔 하기 위해서 환경변수인 colorSheme를 가져올 것이다.
     */
    
    @Environment(\.colorScheme) var colorScheme
    
    
    var diary: MoodDiary
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(formattedDate(dateString: diary.date))
                        .font(.system(size: 30, weight: .bold))
                    
                    Image(systemName: diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                        .frame(height: 80)
                    
                    Text("\(diary.text)")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            
            Spacer()
            HStack {
                Button {
                    print("삭제버튼 눌림")
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .padding()
                }
                .foregroundColor(colorScheme == .dark ? .white : .black)
                Spacer()
            }
        }
        
        
        
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(diary: MoodDiary.list.first!)
    }
}

extension DiaryDetailsView {
    private func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        formatter.locale = Locale(identifier: "ko-KR")
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "EEE, MMM d, yyyy"
        return formatter.string(from: date!)
    }
}

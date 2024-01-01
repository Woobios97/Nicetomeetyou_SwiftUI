//
//  ContentView.swift
//  EmotionDiary
//
//  Created by 김우섭 on 2022/07/02.
//

import SwiftUI

struct DiaryListView: View {
    
    @StateObject var vm: DiaryListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    /*
    그리드뷰를 표시할 때 먼저, 각 섹션 별로 먼저 구분을 한 다음에, 각 섹션을 그리는 데, 각 섹션 별로
    셀을 표시한 것을 확인할 수 있다.
    그리드 안에 섹션 별로 섹션을 표시하고, 섹션 안에 여러개 보여지는 데이터는 섹션 안에 콘텐츠에 표시하는 부분에서 표시했다.
    섹션에 헤더는 텍스트뷰를 통해서 표시했다.
    */
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(vm.keys, id: \.self) { key in
                            Section {
                                let items = vm.dic[key] ?? []
                                let orderedItems = items.sorted(by: { $0.date < $1.date })
                                ForEach(orderedItems) { item in
                                    MoodDiaryCell(diary: item)
                                        .frame(height: 50)
                                }
                            } header: {
                                Text(formattedSectionTitle(key))
                                    .font(.system(size: 30, weight: .black))
                            }
                            .frame(height: 60)
                            .padding()
                        }
                    }
                }
                HStack {
                    Button {
                        print("new button Tapped")
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(40)
                }
            }
            .navigationTitle("감정 일기")
            
        }
    }
}

extension DiaryListView {
    // "2022-4" -> "April 2022" or "4월 2022"
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap{ Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}

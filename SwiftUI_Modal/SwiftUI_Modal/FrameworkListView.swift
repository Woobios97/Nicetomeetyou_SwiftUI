//
//  ContentView.swift
//  SwiftUI_Modal
//
//  Created by 김우섭 on 12/23/23.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var vm = FrameworkListViewModel()
    
    /*
     list를 ViewModel로 바꾸는 작업을 먼저 해줘야한다.
     왜?
     Cell을 눌렀을 때, 띄우기 위해서는 띄운다는 변수를 만들어줘야한다?
     왜 만들어줘야하냐?
     Sheet라는 것을 이용해서 만들어줄려고 한다.
     */
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        // Grid 만들기
        // - UIKit : UICollectionView
        //   - Data, Presentaion, Layout
        // - SwiftUI : LazyVGrid, LazyHGrid
        //   - ✅ Data, ✅ Presentaion, ✅ Layout
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach($vm.models) { $item in
                        FrameworkCell(framework: $item)
                            .onTapGesture {
                                vm.isShowingDetail = true
                                vm.selectedItem = item
                                // $ 있는 것은 바인딩된 것인데, $을 벗기면 실제 값이다.
                            }
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        .sheet(isPresented: $vm.isShowingDetail, content: {
            let vm = FrameworkDetailViewModel(framework: vm.selectedItem!)
            FrameworkDetailView(viewModel: vm)
        })
        //        .fullScreenCover(isPresented: $vm.isShowingDetail, content: {
        //            let vm = FrameworkDetailViewModel(framework: vm.selectedItem!)
        //            FrameworkDetailView(viewModel: vm)
        //        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}

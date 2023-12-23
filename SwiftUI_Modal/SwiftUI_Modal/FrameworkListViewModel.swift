//
//  FrameworkListViewModel.swift
//  SwiftUI_Modal
//
//  Created by 김우섭 on 12/23/23.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
}

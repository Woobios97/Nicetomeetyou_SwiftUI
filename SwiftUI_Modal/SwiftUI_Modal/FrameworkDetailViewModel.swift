//
//  FrameworkDetailViewModel.swift
//  SwiftUI_Modal
//
//  Created by 김우섭 on 12/23/23.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    /*
    @Binding을 쓴다는 것은 변수가 바라보는 Single source of Data가 있다는 것이다.
    */
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}

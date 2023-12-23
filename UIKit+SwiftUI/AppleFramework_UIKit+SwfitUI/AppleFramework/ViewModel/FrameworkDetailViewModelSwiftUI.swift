//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 김우섭 on 2023/12/24.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModelSwiftUI: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}

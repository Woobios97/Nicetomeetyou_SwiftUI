//
//  SwiftUI_EnvironmentObjectApp.swift
//  SwiftUI_EnvironmentObject
//
//  Created by 김우섭 on 12/21/23.
//

import SwiftUI

@main
struct SwiftUI_EnvironmentObjectApp: App {
    
    @StateObject var userProfile = UserProfileSettings()
    
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(userProfile)  
            // -> FirstView() 에서 ChildView까지 userProfile에 대한 정보가 넘어가 지는 것이다.
        }
    }
}

//
//  ThirdView.swift
//  SwiftUI_EnvironmentObject
//
//  Created by 김우섭 on 12/21/23.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Current Age: \(userProfile.age)")
            
            Text("Third View")

            Button {
                userProfile.haveBirthDayParty()
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    ThirdView().environmentObject(UserProfileSettings())
}

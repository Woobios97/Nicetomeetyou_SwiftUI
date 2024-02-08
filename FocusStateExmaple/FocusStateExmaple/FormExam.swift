//
//  Form.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

struct FormExam: View {
    
    enum NotifyMeAboutType {
        case directMessage
        case metions
        case anything
    }
    
    enum ProfileImageSize {
        case large
        case medium
        case small
    }
    
    @State var notifyMeAbout = NotifyMeAboutType.directMessage
    @State var playNotificationSounds = false
    @State var profileImageSize = ProfileImageSize.large
    @State var sendReadReceipts = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages").tag(NotifyMeAboutType.directMessage)
                        Text("Mentions").tag(NotifyMeAboutType.metions)
                        Text("Anything").tag(NotifyMeAboutType.anything)
                    }
                    .pickerStyle(.navigationLink)
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        Text("Large").tag(ProfileImageSize.large)
                        Text("Medium").tag(ProfileImageSize.medium)
                        Text("Small").tag(ProfileImageSize.small)
                    }
                    .pickerStyle(.navigationLink)
                    Button("Clear Image Cache") {}
                }
            }
        }
    }
}

#Preview {
    FormExam()
}

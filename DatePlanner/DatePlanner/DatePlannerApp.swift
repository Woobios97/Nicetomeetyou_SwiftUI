//
//  DatePlannerApp.swift
//  DatePlanner
//
//  Created by woosub kim  on 1/24/24.
//

import SwiftUI

@main
struct DatePlannerApp: App {
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
            
        }
    }
}

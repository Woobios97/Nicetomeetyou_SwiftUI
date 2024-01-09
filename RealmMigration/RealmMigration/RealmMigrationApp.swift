//
//  RealmMigrationApp.swift
//  RealmMigration
//
//  Created by woosub kim  on 1/9/24.
//

import SwiftUI

@main
struct RealmMigrationApp: App {
    
    let migrator = Migrator()
    
    var body: some Scene {
        WindowGroup {
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}

//
//  Realm_GroceryAppApp.swift
//  Realm_GroceryApp
//
//  Created by 김우섭 on 12/29/23.
//

import SwiftUI

@main
struct Realm_GroceryAppApp: App {
    
    let migrator = Migrator()
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintsBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}

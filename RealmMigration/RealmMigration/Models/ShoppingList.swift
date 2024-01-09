//
//  ShoppingList.swift
//  RealmMigration
//
//  Created by woosub kim  on 1/9/24.
//

import Foundation
import RealmSwift

class ShoppingList: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var adress: String
    @Persisted var number: Int
    
    @Persisted var items: List<ShoppingItem> = List<ShoppingItem>()
    
    override class func primaryKey() -> String? {
        "id"
    }
}



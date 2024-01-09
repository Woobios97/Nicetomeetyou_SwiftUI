//
//  ShoppingItem.swift
//  RealmMigration
//
//  Created by woosub kim  on 1/9/24.
//

import Foundation
import RealmSwift

class ShoppingItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

//
//  ShoppingItem.swift
//  Realm_GroceryApp
//
//  Created by 김우섭 on 12/29/23.
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

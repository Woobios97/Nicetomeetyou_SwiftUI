//
//  ShoppingList.swift
//  Realm_GroceryApp
//
//  Created by 김우섭 on 12/29/23.
//

import Foundation
import RealmSwift

class ShoppingList: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}

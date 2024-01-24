//
//  EventTask.swift
//  DatePlanner
//
//  Created by woosub kim  on 1/24/24.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

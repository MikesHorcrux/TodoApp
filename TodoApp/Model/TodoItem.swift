//
//  TodoItem.swift
//  TodoApp
//
//  Created by Mike on 4/13/23.
//

import Foundation

struct TodoItem {
    var id: UUID = UUID()
    var label: String
    var isDone: Bool
}

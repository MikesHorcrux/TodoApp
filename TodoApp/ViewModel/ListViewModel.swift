//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Mike on 4/13/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    /// Function updates Todo item done status
    /// - Parameter item: TodoItem
    func updateIsDoneStatus(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isDone.toggle()
        }
    }
    
    /// Delete Todo item from list
    /// - Parameter item: TodoItem
    func deleteItem(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }
    
    /// Add Item to list
    /// - Parameter title: String
    func addItem(title: String) {
        let todoItem = TodoItem(id: UUID(), label: title, isDone: false)
        items.append(todoItem)
    }
}

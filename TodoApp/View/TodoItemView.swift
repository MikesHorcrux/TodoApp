//
//  TodoItemView.swift
//  TodoApp
//
//  Created by Mike on 4/13/23.
//

import SwiftUI

struct TodoItemView: View {
    @ObservedObject var viewModel: ListViewModel
    @Binding var isEditing: Bool
    var item: TodoItem
    var body: some View {
        HStack {
            Text(item.label)
                .strikethrough(item.isDone, color: .orange)
            Spacer()
            if item.isDone {
                Button("unDone") {
                    viewModel.updateIsDoneStatus(item: item)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
            } else {
                Button("done") {
                    viewModel.updateIsDoneStatus(item: item)
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.orange)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(viewModel: ListViewModel(), isEditing: .constant(false), item: TodoItem(label: "grab coffee", isDone: false))
    }
}

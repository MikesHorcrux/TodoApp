//
//  ContentView.swift
//  TodoApp
//
//  Created by Mike on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ListViewModel()
    @State var itemText: String = ""
    @State var isEditing: Bool = false
    var body: some View {
        List{
            Section{
                HStack {
                    TextField("Grabbing Coffee...", text: $itemText)
                    Button("add") {
                        viewModel.addItem(title: itemText)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            Section {
                ForEach(viewModel.items.filter({ item in
                    item.isDone == false
                }), id: \.id) { item in
                    TodoItemView(viewModel: viewModel, isEditing: $isEditing, item: item)
                }
            } header: {
                Text("ToDo's:")
            }
            
            Section {
                ForEach(viewModel.items.filter({ item in
                    item.isDone == true
                }), id: \.id) { item in
                    TodoItemView(viewModel: viewModel, isEditing: $isEditing, item: item)
                }
            } header: {
                Text("ToDone's:")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

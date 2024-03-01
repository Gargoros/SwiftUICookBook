//
//  EditableListsFields.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 29.02.24.
//

import SwiftUI

struct EditableListsFields: View {
    //MARK: - Variables
    @State private var todos: [ToDoItem] = [
        ToDoItem(title: "Eat"),
        ToDoItem(title: "Sleep"),
        ToDoItem(title: "Code")
    ]
    
    //MARK: - Views
    var body: some View {
        List ($todos){ $todo in
            TextField("ToDo Item", text: $todo.title)
        }
    }
}

#Preview {
    EditableListsFields()
}

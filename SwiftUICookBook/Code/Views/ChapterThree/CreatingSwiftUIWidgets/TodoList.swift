//
//  TodoList.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct TodoList: View {
    @State var tasks = TaskInfo.tasks
        var body: some View {
            TaskListView(tasks: $tasks)
        }
}

#Preview {
    TodoList()
}

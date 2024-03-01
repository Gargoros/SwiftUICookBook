//
//  TaskListView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct TaskListView: View {
    //MARK: - Variables
    @Binding var tasks: [TaskInfo]
    
    //MARK: - Views
    var body: some View {
        List{
            ForEach($tasks) { task in
                TaskInfoView(task: task)
            }
        }
        .navigationTitle(Text("To do list"))
    }
}

#Preview {
    TaskListView(tasks: .constant(TaskInfo.tasks))
}

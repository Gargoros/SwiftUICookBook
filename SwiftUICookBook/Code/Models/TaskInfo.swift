//
//  TaskInfo.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import Foundation

struct TaskInfo: Identifiable {
    let id = UUID()
    var completed: Bool
    var description: String
    var priority: TaskPriority
}

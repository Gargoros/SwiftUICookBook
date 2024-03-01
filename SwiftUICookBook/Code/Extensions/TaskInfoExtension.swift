//
//  TaskInfoExtension.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import Foundation

extension TaskInfo {
    
    static var tasks = [
            TaskInfo(completed: false, description: "Wake up", priority: .low ),
            TaskInfo(completed: false, description: "Shower", priority: .medium),
            TaskInfo(completed: false, description: "Code", priority: .high),
            TaskInfo(completed: false, description: "Eat", priority: .high ),
            TaskInfo(completed: false, description: "Sleep", priority: .high),
            TaskInfo(completed: false, description: "Get groceries", priority: .high)
        ]
    
    static var task = tasks[0]
}

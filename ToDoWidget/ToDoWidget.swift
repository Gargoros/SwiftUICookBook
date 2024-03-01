//
//  ToDoWidget.swift
//  ToDoWidget
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import WidgetKit
import SwiftUI

struct TaskEntry: TimelineEntry{
    let date: Date
    let task: TaskInfo
}

struct Provider: TimelineProvider{
    
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(date: Date(), task: .task)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> Void) {
        let entity = TaskEntry(date: Date(), task: .task)
        completion(entity)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TaskEntry>) -> Void) {
        
        var entries: [TaskEntry] = []
        let currentDate = Date()
        let filteredTasks = TaskInfo.tasks.sorted(by: { $0.priority > $1.priority })
        
        for index in 0..<filteredTasks.count {
            let task = filteredTasks[index]
            let entryDate = Calendar.current.date(byAdding: .second, value: index * 10, to: currentDate)!
            let entry = TaskEntry(date: entryDate, task: task)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ToDoWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack{
            Image(systemName: imageName(forTask: entry.task))
            Text(entry.task.description)
        }
        .containerBackground(for: .widget){
            Color(.widgetBackground)
        }
    }
    
    private func imageName(forTask task: TaskInfo) -> String {
        switch task.priority {
        case .high: "arrowshape.up.circle"
        case .medium: "arrowshape.forward.circle"
        case .low: "arrowshape.down.circle"
        }
    }
}

struct ToDoWidget: Widget {
    let kind: String = "ToDoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ToDoWidgetEntryView(entry: entry)
            } else {
                ToDoWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Task List Widget")
        .description("Shows next pressing item on a todo list")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview("small", as: .systemSmall) { ToDoWidget() } timelineProvider: { Provider() }

#Preview("medium", as: .systemMedium) { ToDoWidget() } timeline: {
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Wake up", priority: .low))
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Shower", priority: .medium))
    TaskEntry(date: Date(), task: TaskInfo(completed: false, description: "Code", priority: .high))
}

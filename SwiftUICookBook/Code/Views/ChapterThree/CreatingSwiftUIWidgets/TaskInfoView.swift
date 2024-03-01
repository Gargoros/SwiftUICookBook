//
//  TaskInfoView.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 1.03.24.
//

import SwiftUI

struct TaskInfoView: View {
    //MARK: - Variables
    @Binding var task: TaskInfo
    
    //MARK: - Views
    var body: some View {
        HStack {
            
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(task.completed ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.task.completed.toggle()
                }
            
            Text(task.description)
                .font(.title2)
                .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    
    TaskInfoView(task: .constant(TaskInfo.task))
}

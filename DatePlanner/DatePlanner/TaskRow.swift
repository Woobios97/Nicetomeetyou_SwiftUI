//
//  TaskRow.swift
//  DatePlanner
//
//  Created by woosub kim  on 1/24/24.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask
    var isEditing: Bool
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            if isEditing || task.isNew {
                TextField("할일을 쓰세요", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
            } else {
                Text(task.text)
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .task {         // task?
            if task.isNew {
                isFocused = true
            }
        }
    }
}

#Preview {
    TaskRow(task: .constant(EventTask(text: "Do Something!")), isEditing: false)
}

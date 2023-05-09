//
//  NewToDoView.swift
//  toDoListForLesson
//
//  Created by scholar on 5/1/23.
//

import SwiftUI

struct NewToDoView: View {
    
    @Environment(\.managedObjectContext) var context

    @Binding var showNewTask : Bool

    
    @State var title: String
    @State var isImportant: Bool
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
                TextField("", text: $title).padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                    .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
                    .font(.system(size: 20))
            }
            .padding()

            Button(action: {
                self.showNewTask = false
                self.addTask(title: self.title, isImportant: self.isImportant)
    
            }) {
                Text("Add")

            }
            .padding()
            

        }
    }
    private func addTask(title: String, isImportant: Bool = false) {
        
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(showNewTask: .constant(true), title: "", isImportant: false)
    }
}

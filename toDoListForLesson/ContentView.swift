//
//  ContentView.swift
//  toDoListForLesson
//
//  Created by scholar on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems: [ToDoItem] = []
    
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                Button(action: {
                    self.showNewTask = true
                }) {
                Text("+")
                        .font(.largeTitle)
                }
            }
            .padding()
            Spacer()
            List (toDoItems) { toDoItem in
                if toDoItem.isImportant == true {
                    Text("‼️ " + toDoItem.title)
                } else {
                    Text(toDoItem.title)

                }
                
            }.listStyle(.plain)
                .animation(.easeOut, value: showNewTask)

        }
        
    
        
        if showNewTask {            
            NewToDoView(toDoItems: $toDoItems, showNewTask: $showNewTask, title: "", isImportant: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut, value: showNewTask)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

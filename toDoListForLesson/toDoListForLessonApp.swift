//
//  toDoListForLessonApp.swift
//  toDoListForLesson
//
//  Created by scholar on 5/1/23.
//

import SwiftUI

@main
struct toDoListForLessonApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

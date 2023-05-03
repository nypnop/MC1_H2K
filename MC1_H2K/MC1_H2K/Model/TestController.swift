//
//  TestController.swift
//  MC1_H2K
//
//  Created by Rivan Mohammad Akbar on 03/05/23.
//

import Foundation
import CoreData

class TestController: ObservableObject {
    let container = NSPersistentContainer(name: "AttachmentStyleTest")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data have been saved")
        } catch {
            print("Data could not be save")
        }
    }
    
    func addQuestion(questionPrompt: String, tags: String, context: NSManagedObjectContext ) {
        let question = AttachmentTestData(context: context)
        question.id = UUID()
        question.questionPrompt = questionPrompt
        question.tags = tags
        
        save(context: context)
    }
}

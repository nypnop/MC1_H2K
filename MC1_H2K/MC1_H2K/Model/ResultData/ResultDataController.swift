//
//  TestController.swift
//  MC1_H2K
//
//  Created by Rivan Mohammad Akbar on 03/05/23.
//

import Foundation
import CoreData

class ResultDataController: ObservableObject {
    let container = NSPersistentContainer(name: "ResultData")
    
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
    
//    func addQuestion(questionPrompt: String, tags: String, context: NSManagedObjectContext ) {
//        let question = AttachmentTestData(context: context)
//        question.id = UUID()
//        question.questionPrompt = questionPrompt
//        question.tags = tags
//
//        save(context: context)
//    }
    
    func addTestResult(type: String, secure: Int64, avoidant: Int64, anxious: Int64, date: Date, disorganize: Int64, context: NSManagedObjectContext) {
        let resultData = ResultData(context: context)
        resultData.id = UUID()
        resultData.date = Date()
        resultData.type = type
        resultData.secure = secure
        resultData.anxious = anxious
        resultData.avoidant = avoidant
        resultData.disorganize = disorganize
        
        save(context: context)
    }
}

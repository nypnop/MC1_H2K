//
//  TestController.swift
//  MC1_H2K
//
//  Created by Rivan Mohammad Akbar on 03/05/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ResultData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        
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
//
//    func addTestResult(type: String, secure: Int64, avoidant: Int64, anxious: Int64, date: Date, disorganize: Int64, context: NSManagedObjectContext) {
//        let resultData = ResultData(context: context)
//        resultData.id = UUID()
//        resultData.date = Date()
//        resultData.type = type
//        resultData.secure = secure
//        resultData.anxious = anxious
//        resultData.avoidant = avoidant
//        resultData.disorganize = disorganize
//
//        save(context: context)
//    }
    
    

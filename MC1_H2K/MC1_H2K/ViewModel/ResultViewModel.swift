//
//  ResultViewModel.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 04/05/23.
//

import Foundation
import CoreData

class ResultViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var resultArray = [ResultData]()
    
    init() {
        fetchResultData()
    }
    
    func fetchResultData() {
        let request = NSFetchRequest<ResultData>(entityName: "ResultData")
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
                
        do {
            resultArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addTestResult(secure: Int64, avoidant: Int64, anxious: Int64, disorganize: Int64) {
        let resultData = ResultData(context: viewContext)
        resultData.id = UUID()
        resultData.date = Date()
        if secure > anxious && secure > avoidant && secure > disorganize {
            resultData.type = "Secure"
        }
        if anxious > secure && anxious > avoidant && anxious > disorganize {
            resultData.type = "Anxious"
        }
        if avoidant > anxious && avoidant > secure && avoidant > disorganize {
            resultData.type = "Dismissive Avoidant"
        }
        if disorganize > anxious && disorganize > avoidant && disorganize > secure {
            resultData.type = "Fearful-Avoidant"
        }
        resultData.secure = secure
        resultData.anxious = anxious
        resultData.avoidant = avoidant
        resultData.disorganize = disorganize

        save()
        self.fetchResultData()
    }
    
    func calculateRate(yourAS:String, otherAS:String) -> Float {
        let dictRate: [String:Float] = ["Secure":50,
                                        "Anxious":25,
                                        "Dismissive Avoidant":25,
                                        "Fearful-Avoidant":0]
        return ((dictRate[yourAS] ?? 0)+(dictRate[otherAS] ?? 0))
    }
//    Secure","Anxious","Dismissive Avoidant","Fearful-Avoidant
    func save() {
        do{
            try viewContext.save()
            print("Data Saved")
        }catch {
            print("Error Saving")
        }
    }
    
    
}

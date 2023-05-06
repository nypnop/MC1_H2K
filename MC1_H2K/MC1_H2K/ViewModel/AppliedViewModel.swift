//
//  AppliedViewModel.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 05/05/23.
//

import Foundation
import CoreData

class AppliedViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var compatibilityArray = [Compatibility]()
    
    init() {
        fetchCompatibility()
    }
    
    func fetchCompatibility() {
        let request = NSFetchRequest<Compatibility>(entityName: "Compatibility")
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
                
        do {
            compatibilityArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func setStarterPack(aS:String, role: String) -> [[String]]{
        if role=="Children" {
            return primaryPSuggestion[aS]!
        }
        else {
            return primaryCSuggestion[aS]!
        }
    }
    
    func showCSCards(aS:String, role: String) -> [CSData] {
        let temp:[[String]] = setStarterPack(aS: aS, role: role)
        var ans:[CSData] = []
        for data in temp {
            ans.append(CSData(message: data[0], subMessage: data[1]))
        }
        return ans
    }
    
    func randomSuggestion(role:String) -> [String] {
        return [""]
    }
    
    
}
//    let CSCards = [
//        CSData(message: "chat wa 1", subMessage: "deskripsi chat wa 1"),
//        CSData(message: "chat wa 2", subMessage: "deskripsi chat wa 2"),
//        CSData(message: "chat wa 3", subMessage: "deskripsi chat wa 3"),
//    ]

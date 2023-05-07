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
    
    func randomSuggestion(aS:String, role:String) -> [(String,String,String,String)] {
        var cards = [(String,String,String,String)]()
        var card = [(String,String,String,String)]()
        if universalSuggestion[role] == nil {
             card = universalSuggestion["Children"]!
        }else{
             card = universalSuggestion[role]!
        }

        let shuffle = card.shuffled()
        var count = 0
        if aS != "Secure" {
            cards.append(("Saran Topik", "Whatsapp", "Ayo ngobrol lebih dalam menggunakan saran topik ini!","ConversationStarter"))
            for b in shuffle {
                if count < 3{
                    cards.append(b)
                } else {
                    break
                }
                count = count + 1
            }
        }
        else {
            for b in card {
                if count < 4{
                    cards.append(b)
                } else {
                    break
                }
                count = count + 1
            }
        }
        return cards
    }
}

//
//  CompatibilityViewModel.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 04/05/23.
//

import Foundation
import CoreData

class CompatibilityViewModel: ObservableObject {
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
    
    func addCompatibility(yourAS:String,otherAS:String,role:String,comment:String){
        let comp = Compatibility(context: viewContext)
        comp.id = UUID()
        comp.yourAS = yourAS
        comp.otherAS = otherAS
        comp.comment = comment
        comp.date = Date.now
        comp.role = role
        comp.rate = calculateRate(yourAS: yourAS, otherAS: otherAS)
        save()
        self.fetchCompatibility()
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
        }catch {
            print("Error Saving")
        }
    }
    
    
}



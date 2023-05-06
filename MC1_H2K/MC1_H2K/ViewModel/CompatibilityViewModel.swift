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
    
    func addCompatibility(yourAS:String,otherAS:String,role:String,comment:String,image:String,image2:String){
        let comp = Compatibility(context: viewContext)
        comp.id = UUID()
        comp.yourAS = yourAS
        comp.otherAS = otherAS
        comp.comment = comment
        comp.date = Date.now
        comp.role = role
        comp.rate = calculateRate(yourAS: yourAS, otherAS: otherAS)
        comp.image = mappingImage(aS: yourAS)
        comp.image2 = mappingImage(aS: otherAS)
        
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
    
    func mappingImage(aS: String) -> String{
        let dictImage: [String:String] = ["Secure":"Avatar-SE",
                                          "Anxious":"Avatar-AX",
                                          "Dismissive Avoidant":"Avatar-DA",
                                          "Fearful-Avoidant":"Avatar-FA"]
        return dictImage[aS] ?? "Not Found"
                                          
    }
    
    func getImagebyID(id: UUID) -> String{
        let ans = compatibilityArray.filter { comp in
            comp.id == id
        }
        return ans.first?.image ?? ""
    }
    
    func save() {
        do{
            try viewContext.save()
        }catch {
            print("Error Saving")
        }
    }
    

}



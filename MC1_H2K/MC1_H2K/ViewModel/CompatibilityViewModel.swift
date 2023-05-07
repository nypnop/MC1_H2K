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
        comp.date = Date.now
        comp.role = role
        comp.comment = comments(aS: otherAS, role:role)
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
    
    func getLatestData() -> Bool{
        return compatibilityArray.isEmpty ? false : true
    }
    
    func getLatestRole() -> String{
        return compatibilityArray.first?.role ?? ""
    }
    
    func comments(aS:String, role:String) -> String {
        let dictComment: [[String]:String] = [
            ["Secure","Children"]:"WAHH!! SELAMAT!! Ortu Anda Secure Attachment Style loh. Ini sih umumnya karena hubungan ortu dengan anak sejak kecil baik sekali.\n\nBeberapa ciri - ciri orang dengan Attachment Style Secure.\n\nCoba lihat deh. Sesuai ga dengan orang tua kamu?\n\n1. Dia sanggup mengatur emosi dan perasaannya\n\n2. Ketika sendirian, dia punya keinginan yang kuat\n\n3. Ahli dalam berteman, dan mempercayai orang lain\n\n4. Tahu apa yang dia inginkan dalam hidup\n\n5. Bisa mengkomunikasikan kebutuhannya secara efektif\n\n6. Nyaman dengan kedekatan\n\n7. Bisa memberikan dan menerima support emosional\n\nTidak ada tips nih untuk kamu karena yang kamu lakukan udah bagus banget nih sebagai anak.\n\nPaling, kamu bisa coba nih ada beberapa ide kami yang bisa buat ortu kamu bahagia:",
            ["Anxious","Children"]:"Hai.. Kalau hasil test ortu kamu tulisnya Anxious Attachment Style, ini nih biasanya ciri cirinya:\n\nMereka sering kali melakukan sesuatu yang mungkin kamu lihatnya ga perlu sebegitunya, tapi yang mereka lakukan karena mereka butuh perhatian\n\nMereka memandang tinggi kamu dan sering kali memandang rendah diri sendiri\n\nMereka selalu berusaha untuk memancing pertanyaan atau perbuatan yang dimana harapannya supaya kamu bisa menunjukkan kasih sayang dan memberi rasa aman kepada mereka\n\nYang harus kamu lakukan nih kalau orang tua kamu Anxious\n\nCoba deh kamu belajar untuk lebih ekspresif dalam menunjukkan ekspresi sayang kamu\n\nPerkuat rasa aman kepada mereka\n\nIngatkan selalu bahwa kamu mencintai mereka",
            ["Dismissive Avoidant","Children"]:"Wah.. Orang tua kamu hasilnya Avoidant nih Attachment Style nya. Sebelum kita memutuskan mesti gimana, kamu harus paham dulu nih Avoidant Attachment Style itu gimana.\n\nOrang tua dengan Avoidant Attachment Style biasanya:\n\nMenghindari kedekatan secara emosional maupun fisik dengan anaknya\n\nMenolak usaha dari anaknya untuk membicarakan atau mencari solusi atas sifatnya.\n\nMenutup diri\n\nMenghindari konflik sebisa mungkin dan tidak mengkomunikasikan keinginan dan kebutuhannya\n\nPemikiran hitam dan putih ( Sesuatu hal akan ditentukan sangat baik atau sangat buruk secara ekstrim ) seringkali akan memperkeruh hubungan\n\nMeragukan hubungannya dengan anaknya\n\nBeberapa tips nih buat kamu kalau orang tua kamu Avoidant Attachment Style:\n\nTetap berpikir positif apabila dia tidak menunjukkan sisi emosional mereka seperti senyum atau berterima kasih karena sebenarnya di lubuk hati mereka, mereka itu takut untuk di judge\n\nSebisa mungkin hindari mengkritik dia karena mereka akan sangat terlukan apabila dikritik oleh orang yang mereka cintai\n\nAkan butuh waktu yang cukup lama oleh dia untuk belajar untuk mempercayai orang lain\n\nBerikan personal space kepada dia saat mereka membutuhkannya. Butuh ME TIME istilahnya\n\nPelan pelan bangun kepercayaan kepada dia, karena sebenarnya mereka hanya takut dikecewakan",
            ["Fearful-Avoidant","Children"]:"Wah.. Ortu kamu hasilnya Disorganized nih Attachment Style nya. Sebelum kita memutuskan mesti gimana, kamu harus paham dulu nih Disorganized Attachment Style itu gimana.\n\nni ada beberapa ciri orang dengan Disorganized Attachment Style. Coba lihat apakah sesuai dengan orang tua kamu.\n\n1. Memiliki relasi yang kacau, tidak bisa diprediksi, dan tegang\n\n2. Ketakutan berlebihan terhadap penolakan, dibarengi dengan kesulitan untuk terhubung dan percaya kepada orang lain.\n\n3. Keinginan berlebih untuk dekat dengan seseorang, namun juga dibarengi dengan kecenderungan untuk menolak kedekatan dan membuat orang menjauh\n\n4. Perilaku agresif dengan orang sekitar, terutama orang dekat\n\n5. Takut dengan orang tua atau pasangan\n\n6. Memandang rendah diri sendiri\n\n7. Memiliki rasa malu yang mendalam\n\n8. Cenderung depresi dan cemas\n\n9. Merasa tidak dicintai dan tidak layak dicintai\n\nBeberapa tips nih buat kamu kalau ortu kamu Disorganized Attachment Style:\n\n80% anak yang diperlakukan tidak baik memiliki attachment ini. Kemungkinan besar ini yang dialami ortu kamu. Bisa coba berempati dengannya. Dan kalau ada kesempatan bisa coba digali ceritanya\n\nCoba paham dirinya dan pelan pelan yakinkan dia untuk menjalankan theraphy apabila memungkinkan.",
            ["Secure","Parent"]:"WAHH!! SELAMAT!! Anak Anda Secure Attachment Style loh. Ini sih umumnya karena hubungan ortu dengan anak sejak kecil baik sekali.\n\nBeberapa ciri - ciri orang dengan Attachment Style Secure.\n\nCoba lihat deh. Sesuai ga dengan anak kamu?\n\n1. Dia sanggup mengatur emosi dan perasaannya\n\n2. Ketika sendirian, dia punya keinginan yang kuat\n\n3. Ahli dalam berteman, dan mempercayai orang lain\n\n4. Tahu apa yang dia inginkan dalam hidup\n\n5. Bisa mengkomunikasikan kebutuhannya secara efektif\n\n6. Nyaman dengan kedekatan\n\n7. Bisa memberikan dan menerima support emosional\n\nTidak ada tips nih untuk kamu karena yang kamu lakukan udah bagus banget nih sebagai orang tua.\n\nPaling, kamu bisa coba nih ada beberapa ide kami yang bisa buat anak kamu bahagia:",
            ["Anxious","Parent"]:"Hai.. Kalau hasil test anak kamu tulisnya Anxious Attachment Style, ini nih biasanya ciri cirinya:\n\nDia sering kali melakukan sesuatu yang mungkin kamu lihatnya ga perlu sebegitunya, tapi yang ia lakukan karena mereka butuh perhatian\n\nDia memandang tinggi kamu dan sering kali memandang rendah diri sendiri\n\nDia selalu berusaha untuk memancing pertanyaan atau perbuatan yang dimana harapannya supaya kamu bisa menunjukkan kasih sayang dan memberi rasa aman kepada dia\n\nYang harus kamu lakukan nih kalau anak kamu Anxious\n\nCoba deh kamu belajar untuk lebih ekspresif dalam menunjukkan ekspresi sayang kamu\n\nPerkuat rasa aman kepada mereka\n\nIngatkan selalu bahwa kamu mencintai mereka",
            ["Dismissive Avoidant","Parent"]:"Wah.. Anak kamu hasilnya Avoidant nih Attachment Style nya. Sebelum kita memutuskan mesti gimana, kamu harus paham dulu nih Avoidant Attachment Style itu gimana.\n\nAnak dengan Avoidant Attachment Style biasanya:\n\nMenghindari kedekatan secara emosional maupun fisik dengan orang tua\n\nMenolak usaha dari ortu untuk membicarakan atau mencari solusi atas sifatnya.\n\nMenutup diri\n\nMenghindari konflik sebisa mungkin dan tidak mengkomunikasikan keinginan dan kebutuhannya\n\nPemikiran hitam dan putih ( Sesuatu hal akan ditentukan sangat baik atau sangat buruk secara ekstrim ) seringkali akan memperkeruh hubungan\n\nMeragukan hubungannya dengan ortu\n\nBeberapa tips nih buat kamu kalau anak kamu Avoidant Attachment Style:\n\nTetap berpikir positif apabila dia tidak menunjukkan sisi emosional mereka seperti senyum atau berterima kasih karena sebenarnya di lubuk hati mereka, mereka itu takut untuk di judge\n\nSebisa mungkin hindari mengkritik dia karena mereka akan sangat terlukan apabila dikritik oleh orang yang mereka cintai\n\nAkan butuh waktu yang cukup lama oleh dia untuk belajar untuk mempercayai orang lain\n\nBerikan personal space kepada dia saat mereka membutuhkannya. Butuh ME TIME istilahnya\n\nPelan pelan bangun kepercayaan kepada dia, karena sebenarnya mereka hanya takut dikecewakan",
            ["Fearful-Avoidant","Parent"]:"Wah.. Anak kamu hasilnya Disorganized nih Attachment Style nya. Sebelum kita memutuskan mesti gimana, kamu harus paham dulu nih Disorganized Attachment Style itu gimana.\n\nni ada beberapa ciri orang dengan Disorganized Attachment Style. Coba lihat apakah sesuai dengan anak kamu.\n\n1. Memiliki relasi yang kacau, tidak bisa diprediksi, dan tegang\n\n2. Ketakutan berlebihan terhadap penolakan, dibarengi dengan kesulitan untuk terhubung dan percaya kepada orang lain.\n\n3. Keinginan berlebih untuk dekat dengan seseorang, namun juga dibarengi dengan kecenderungan untuk menolak kedekatan dan membuat orang menjauh\n\n4. Perilaku agresif dengan orang sekitar, terutama orang dekat\n\n5. Takut dengan orang tua atau pasangan\n\n6. Memandang rendah diri sendiri\n\n7. Memiliki rasa malu yang mendalam\n\n8. Cenderung depresi dan cemas\n\n9. Merasa tidak dicintai dan tidak layak dicintai\n\nBeberapa tips nih buat kamu kalau anak kamu Disorganized Attachment Style:\n\n1. 80% anak yang diperlakukan tidak baik memiliki attachment ini. Jadi, apakah mungkin Anda penyebabnya? Kalau bukan Anda, apakah di tempat lain? Anda harus mencari tahu dulu penyebabnya.\n\n2. Setelah tahu penyebabnya, mungkin Anda akan lebih berempati kepada anak Anda. Sadar bahwa dia sebenarnya hanyalah anak yang terluka\n\n3. Untuk beberapa kasus, boleh dicoba untuk mendukung anaknya menjalankan theraphy."
        ]
        return dictComment[[aS,role]] ?? ""
    }
    
    func save() {
        do{
            try viewContext.save()
        }catch {
            print("Error Saving")
        }
    }
    

}



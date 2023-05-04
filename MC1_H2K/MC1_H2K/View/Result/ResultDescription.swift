//
//  ResultDescription.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultDescription: View {
    var type: String
    let descList: [String] = [
        "Kamu punya kemampuan yang luar biasa untuk membentuk cinta dan hubungan nyaman dengan orang lain. Kamu percaya dengan orang lain dan juga dipercaya nih sama orang sekitarmu. Kamu ga takut dengan keintiman dan ga kaget pas orang lain lagi butuh ME TIME. Kamu juga bisa bergantung dengan orang lain tanpa ada ketergantungan.\n\nMesti berterima kasih nih sama orang tua mu. Soalnya biasanya bisa tercipta, faktor paling besar karena orang tua kamu memperhatikan kebutuhan kamu dan responsif, cepat, dan positif dalam cara menanganinya.",
        "“Takut ditinggalkan”. 19% orang dewasa masuk kategori ini nih. Kamu tidak sendiri kok.\n\nKamu cemas nih terkait perasaan dicintai dan diakui. Ini bisa terlihat dari seseorang merasa insecure terhadap hubungannya, maunya nempel terus. Seringkali, kebutuhannya ga terpenuhi secara konsisten. Sekali lagi, kamu ga sendiri loh.",
        "“Aku mah orangnya MANDIRI”, suka ngomong gitu ya? Ini mah kebalikan dari Anxious. Orang dengan jenis attachment ini biasanya takut dengan keintiman, kesulitan untuk dekat dan percaya dengan orang lain. Hasilnya, hubungannya seringkali terasa kaku dan jauh.\n\nKamu lebih memilih bergantung pada diri sendiri daripada ke orang lain. Sebenarnya lebih tujuannya untuk melindungi diri sendiri, supaya tidak terlalu intim dengan orang lain. Sekitar 25% orang dewasa punya attachment ini. Umumnya sih karena orang tua kurang peka terhadap kebutuhan emosional maupun fisik kamu.",
        "Tipe attachment ini paling jarang ada. Biasanya terjadi karena orangtua atau wali anak yang harusnya jadi sumber perlindungan, malah menjadi sumber ketakutan. Trauma masa kecil dan remaja secara seksual, fisik, atau emosional bisa menjadi sebab utamanya. Respon menakutkan yang ekstrim seperti stres, amarah, dan ga dipedulikan yang mengarahkan anak menjadi punya tipe attachment ini.\n\nAttachment syle yang kompleks ini kombinasi dari anxious dan avoidant yang berseberangan. Ini membuat seseorang menginginkan kasih sayang luar biasa dan juga... menghindarinya. Kamu ini kasih saya dari orang lain namun takut untuk membentukan keintiman apapun.\n\nKalau kamu merasakan hal ini, akan cukup sulit untuk dihadapi sendiri. Boleh coba untuk pergi ke therapist nih."
    ]
    var body: some View {
        VStack{
          Text(type == "Secure" ? descList[0] : type == "Anxious" ? descList[1] : type == "Fearful-Avoidant" ? descList[2] : type == "Dismissive Avoidant" ? descList[3] : "")
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .font(.caption)
        } .frame(width: .infinity, height: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
            .padding()
    }
}

struct ResultDescription_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescription(type: "")
    }
}

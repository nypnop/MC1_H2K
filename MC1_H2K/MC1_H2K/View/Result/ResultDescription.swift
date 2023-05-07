//
//  ResultDescription.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultDescription: View {
    var body: some View {
        VStack{
          Text("Tipe attachment ini paling jarang ada. Biasanya terjadi karena orangtua atau wali anak yang harusnya jadi sumber perlindungan, malah menjadi sumber ketakutan. Trauma masa kecil dan remaja secara seksual, fisik, atau emosional bisa menjadi sebab utamanya. Respon menakutkan yang ekstrim seperti stres, amarah, dan ga dipedulikan yang mengarahkan anak menjadi punya tipe attachment ini.\n\nAttachment syle yang kompleks ini kombinasi dari anxious dan avoidant yang berseberangan. Ini membuat seseorang menginginkan kasih sayang luar biasa dan juga... menghindarinya. Kamu ini kasih saya dari orang lain namun takut untuk membentukan keintiman apapun.\n\nKalau kamu merasakan hal ini, akan cukup sulit untuk dihadapi sendiri. Boleh coba untuk pergi ke therapist nih.")
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
        ResultDescription()
    }
}

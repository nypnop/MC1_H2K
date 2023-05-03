//
//  CompatibilityHistory.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.
//

import SwiftUI

struct CompatibilityHistory: View {
    var body: some View {
        VStack(alignment:.leading){
            ForEach((1...2), id: \.self) {_ in
                CardHistoryCompatibility()
            }.padding(.bottom,-8)
        }.frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("teal25")))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("teal500"), lineWidth:1))
            .padding(.top)
        .padding(.horizontal,24)
    }
}
struct CardHistoryCompatibility: View{
    @State var styleName : String = "Fearful-Avoidant"
    @State var imageName : String = "Avatar-FA"
    var body: some View{
        HStack(alignment:.top){
            VStack(spacing:0){
                Circle()
                    .strokeBorder(Color("teal500"),lineWidth: 1)
                    .frame(width: 24,height: 24)
                    .foregroundColor(Color("teal25"))
                Rectangle()
                    .frame(width: 3,height: 93)
                    .foregroundColor(Color("teal100"))
            }.padding(.trailing,5)
            VStack(alignment:.leading){
                Text("12:56 PM, 28 April 2023")
                    .foregroundColor(Color("GrayLight"))
                    .font(.caption2)
                ComparisonStyle(styleName: $styleName, imageName: $imageName)
            }
            Spacer()
        }
        
    }
}
struct CompatibilityHistory_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityHistory()
    }
}

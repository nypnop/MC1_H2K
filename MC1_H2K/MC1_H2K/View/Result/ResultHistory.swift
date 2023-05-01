//
//  ResultHistory.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultHistory: View {
    var body: some View {
        VStack(alignment:.leading){
            ForEach((1...5), id: \.self) {_ in
                CardHistory()
            }.padding(.bottom,-8)
        }.frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("teal25")))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("teal500"), lineWidth:1))
            .padding()
    }
}
struct CardHistory: View{
    var body: some View{
        
        HStack(alignment:.top){
            VStack(spacing:0){
                Circle()
                    .strokeBorder(Color("teal500"),lineWidth: 1)
                    .frame(width: 24,height: 24)
                    .foregroundColor(Color("teal25"))
                Rectangle()
                    .frame(width: 3,height: 75)
                    .foregroundColor(Color("teal100"))
            }.padding(.trailing,5)
            VStack(alignment:.leading){
                Text("12:56 PM, 28 April 2023")
                    .foregroundColor(Color("GrayLight"))
                    .font(.caption2)
                HStack{
                    Image("Avatar-FA")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 64)
                    VStack(alignment: .leading){
                        Text("Secure")
                            .font(.body)
                            .bold()
                        Text("Attachment Style")
                            .foregroundColor(Color("GrayLight"))
                            .font(.caption)
                    }
                }
            }
            Spacer()
        }
        
    }
}
struct ResultHistory_Previews: PreviewProvider {
    static var previews: some View {
        ResultHistory()
    }
}

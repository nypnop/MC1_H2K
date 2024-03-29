//
//  CompatibilityHistory.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.
//

import SwiftUI

struct CompatibilityHistory: View {
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
    var body: some View {
        VStack(alignment:.leading){
            ForEach(comp, id: \.self) {comps in
                CardHistoryCompatibility(styleName: comps.yourAS ?? "Not Found", otherStyle: comps.otherAS ?? "Not Found", date: comps.date ?? Date.now, imageName: comps.image ?? "Not Found", otherImage: comps.image2 ?? "Not Found")
            }.padding(.bottom,-8)
        }.frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("teal25")))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("teal500"), lineWidth:1))
            .padding(.top)
        .padding(.horizontal,16)
    }
}

struct CardHistoryCompatibility: View{
    var styleName : String
    var otherStyle : String
    var date : Date
    var imageName : String
    var otherImage : String
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
                HStack{
                    Text(date, style: .date)
                    Text(date, style: .time)
                }
                .foregroundColor(Color("GrayLight"))
                .font(.caption2)
                ComparisonStyle(styleName: styleName, otherStyleName: otherStyle, otherimageName: otherImage, imageName: imageName)
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

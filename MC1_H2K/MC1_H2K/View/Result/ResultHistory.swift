//
//  ResultHistory.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultHistory: View {
    @FetchRequest(entity: ResultData.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var resultData: FetchedResults<ResultData>
    var body: some View {
        VStack(alignment:.leading){
            ForEach(resultData, id: \.self) {history in
                CardHistory(type: !resultData.isEmpty ? history.type! : "Not Found" , date: !resultData.isEmpty ? history.date! : Date(), dateString: "")
//                CardHistory(type: history.type ?? "Not Found", date: history.date ?? Date(), dateString: "")
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
    var type: String
    var date: Date
    @State var dateString: String
    
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
                Text(dateString)
                    .foregroundColor(Color("GrayLight"))
                    .font(.caption2)
                HStack{
                    Image(type == "Secure" ? "Avatar-SE" : type == "Anxious" ? "Avatar-AX" : type == "Fearful-Avoidant" ? "Avatar-FA" : type == "Dismissive Avoidant" ? "Avatar-DA" : "")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 64)
                    VStack(alignment: .leading){
                        Text(type)
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
        .onAppear() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm a dd MMMM yyyy"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 7 * 60 * 60)
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            dateString = dateFormatter.string(from: date)
            print(dateString)
            print(type)
            print(date)
        }
        
    }
}
struct ResultHistory_Previews: PreviewProvider {
    static var previews: some View {
        ResultHistory()
    }
}

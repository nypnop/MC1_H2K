//
//  CompatibilityResult.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.
//

import SwiftUI
import Charts
//struct resultCompatibilityRate: Identifiable{
//    var resultRateNumber: Double
//    var id = UUID()
//}
//
//var resultRate: [resultCompatibilityRate] = [
//    resultCompatibilityRate(resultRateNumber: 20)
//]

struct CompatibilityResult: View {
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
//    var resultRate: Double
//    @State var styleName : String = "Fearful-Avoidant"
    @State var imageName : String = "Avatar-FA"
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("Result")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("teal500"))
                Spacer()
            }
            VStack(alignment:.leading){
                ComparisonStyle(styleName: !comp.isEmpty ? comp[0].yourAS ?? "Not Found" : "Not Found", otherStyleName: !comp.isEmpty ? comp[0].otherAS ?? "Not Found" : "Not Found", otherimageName: $imageName, imageName: $imageName)
            }
            VStack(alignment: .leading){
                Text("Compatibility Rate")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                Chart{
                    BarMark(x: .value("rate", !comp.isEmpty ? comp[0].rate : 0)
                    )
                    .foregroundStyle(Color("teal500"))
                    .annotation(position: .trailing){
                        Text(String(format: "♥%.0f%", !comp.isEmpty ? comp[0].rate : 0))
                            .font(.caption2)
                    }
                }
                .chartXScale(domain: 0...100)
                .frame(height: 40)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }.padding(.top,8)
            VStack(alignment: .leading){
                Text("Comments")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                    .padding(.bottom,1)
                Text(!comp.isEmpty ? "\(comp[0].comment ?? "Not Found")" : "Not found")
                    .font(.footnote)
            }.padding(.top,8)
            VStack{
                Button(action: {
//                    print(comp)
                }, label: {
                    Text("Improve it Now")
                        .font(.body)
                        .bold()
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(
                            Color("teal500")
                                .cornerRadius(14)
                        )
                })
            }.padding(.top,8)
            
        }.frame(width: .infinity, height: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("teal25")))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("teal500"), lineWidth:1))
            .padding(.top)
            .padding(.horizontal,24)
    }
}

struct CompatibilityResult_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityResult()
    }
}

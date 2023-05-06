//
//  CompatibilityResult.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.
//

import SwiftUI
import Charts
struct resultCompatibilityRate: Identifiable{
    var resultRateNumber: Double
    var id = UUID()
}

var resultRate: [resultCompatibilityRate] = [
    resultCompatibilityRate(resultRateNumber: 0)
]
struct CompatibilityResult: View {
    @State var isAnimated : Bool = false
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
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
                ComparisonStyle(styleName: !comp.isEmpty ? comp[0].yourAS ?? "Not Found" : "Not Found", otherStyleName: !comp.isEmpty ? comp[0].otherAS ?? "Not Found" : "Not Found", otherimageName: !comp.isEmpty ? comp[0].image2 ?? "Not Found" : "Not Found", imageName: !comp.isEmpty ? comp[0].image ?? "Not Found" : "Not Found")
            }
            VStack(alignment: .leading){
                Text("Compatibility Rate")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                Chart(resultRate){
                    item in
                    BarMark(x: .value("rate", isAnimated && !comp.isEmpty ?  Double(comp[0].rate) : item.resultRateNumber)
                    )
                    .foregroundStyle(Color("teal500"))
                    .annotation(position: .trailing){
                        Text(String(format: "♥%.0f%", !comp.isEmpty ? Double(comp[0].rate) : item.resultRateNumber))
                            .font(.caption2)
                    }
                }
                .chartXScale(domain: 0...110)
                .frame(height: 40)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .onAppear{
                    withAnimation(.easeIn(duration: 2)){
                        isAnimated = true
                    }
                }
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
            .padding(.horizontal,16)
    }
}

struct CompatibilityResult_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityResult()
    }
}

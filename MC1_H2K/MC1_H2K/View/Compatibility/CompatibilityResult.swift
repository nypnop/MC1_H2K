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
    resultCompatibilityRate(resultRateNumber: 20)
]

struct CompatibilityResult: View {
    @State var styleName : String = "Fearful-Avoidant"
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
                ComparisonStyle(styleName: $styleName, imageName: $imageName)
            }
            VStack(alignment: .leading){
                Text("Compatibility Rate")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                Chart(resultRate){
                    item in
                    BarMark(x: .value("rate", item.resultRateNumber)
                    )
                    .foregroundStyle(Color("teal500"))
                    .annotation(position: .trailing){
                        Text(String(format: "♥%.0f%", item.resultRateNumber))
                            .font(.caption2)
                    }
                }
                .chartXScale(domain: 0...100)
                .frame(height: 40)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }.padding(.top,8)
            VStack(alignment: .leading){
                Text("Compatibility Rate")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                    .padding(.bottom,1)
                Text("Kamu perlu berkomunikasi sering-sering!")
                    .font(.footnote)
            }.padding(.top,8)
            VStack{
                Button(action: {
                    //Action
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

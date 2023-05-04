//
//  CompatibilityRate.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 03/05/23.
//

import SwiftUI
import Charts

struct compatibilityRate: Identifiable{
    var rateNumber: Double
    var attachmentType: String
    var id = UUID()
}

var rate: [compatibilityRate] = [
    compatibilityRate(rateNumber: 20, attachmentType: "FA")
]


struct CompatibilityRate: View {
    
    @State var isAnimated : Bool = false
    
    var body: some View {
        Chart(rate){
            item in
            BarMark(x: .value("rate", isAnimated ? item.rateNumber : 0),
                    y: .value("name", item.attachmentType)
            )
            .foregroundStyle(Color("teal500"))
            .annotation(position: .trailing){
                Text(String(format: "♥%.0f%", item.rateNumber))
                    .font(.caption2)
            }
        }
        .chartXScale(domain: 0...100)
        .frame(width: .infinity, height: 40)
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .padding(.horizontal,24)
        .padding(.trailing)
        .onAppear{
            withAnimation(.easeIn(duration: 2)){
                isAnimated = true
            }
        }
    }
    
    
    struct CompatibilityRate_Previews: PreviewProvider {
        static var previews: some View {
            CompatibilityRate()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Compatibility Rate")
        }
    }
}


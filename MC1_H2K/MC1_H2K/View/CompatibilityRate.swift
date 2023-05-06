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
    var id = UUID()
}

var rate: [compatibilityRate] = [
    compatibilityRate(rateNumber: 0)
]


struct CompatibilityRate: View {
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
    @State var isAnimated : Bool = false
    
    var body: some View {
        Chart(rate){
            item in
            BarMark(x: .value("rate", !comp.isEmpty && isAnimated ?  Double(comp[0].rate) : item.rateNumber)
            )
            .foregroundStyle(Color("teal500"))
            .annotation(position: .trailing){
                Text(String(format: "♥%.0f%", !comp.isEmpty ? Double(comp[0].rate) : item.rateNumber))
                    .font(.caption2)
            }
        }
        .chartXScale(domain: 0...110)
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


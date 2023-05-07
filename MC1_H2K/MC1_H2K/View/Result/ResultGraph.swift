//
//  ResultGraph.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI
import Charts

struct styleType: Identifiable{
    var type: String
    var count: Double
    var id = UUID()
}


struct ResultGraph: View {
    @State var data: [styleType] = [
        styleType(type: "Secure", count: 0),
        styleType(type: "Anxious", count: 0),
        styleType(type: "Dismissive-Avoidant", count: 0),
        styleType(type: "Fearful-Avoidant", count: 0)
    ]
    @State var isChartAnimate : Bool = false
    var secure: Int64
    var avoidant: Int64
    var anxious: Int64
    var disorganize: Int64
    
    var body: some View {
        Chart(data){
            item in
            BarMark(
                x: .value("count", isChartAnimate ? item.count : 0),
                y: .value("type", item.type)
            )
            .foregroundStyle(Color("teal500"))
            .annotation(position: .trailing) {
                                Text(String(format: "%.0f%%", item.count))
                                    .font(.caption2)
                                    .padding(.leading, 2)
                            }
        
        }
        .frame(width: .infinity, height: .infinity)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
        .padding()
        .chartYAxis {
            AxisMarks(position: .leading) { _ in
                AxisValueLabel()
                    .font(.caption2)
                    .offset(x:-4)
            }
        }
        .chartXAxis {
            AxisMarks() { _ in
            }
        }
        .chartXScale(domain: 0...110)
        .frame(width: .infinity, height: 292)
        .onAppear{
            data = [
                styleType(type: "Secure", count: Double((secure * 100)/40)),
                styleType(type: "Anxious", count: Double((anxious * 100)/40)),
                styleType(type: "Dismissive-Avoidant", count: Double((avoidant * 100)/40)),
                styleType(type: "Fearful-Avoidant", count: Double((disorganize * 100)/40))
            ]
            print(secure)
            print(avoidant)
            print(anxious)
            print(disorganize)
            withAnimation(.easeIn(duration: 2)){
                isChartAnimate = true
            }
        }
                
    }
    
    struct ResultGraph_Previews: PreviewProvider {
        static var previews: some View {
            ResultGraph(secure: 0, avoidant: 0, anxious: 0, disorganize: 0)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Graph")
        }
    }
}



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

var data: [styleType] = [
    styleType(type: "Secure", count: 25),
    styleType(type: "Anxious", count: 50),
    styleType(type: "Dismissive-Avoidant", count: 55),
    styleType(type: "Fearful-Avoidant", count: 100)
]

let barcolor = Color(UIColor(named: "teal500")!)

struct ResultGraph: View {
    var body: some View {
        Chart(data){
            item in
            BarMark(
                x: .value("count", item.count),
                y: .value("type", item.type)
            )
            .foregroundStyle(barcolor)
            .annotation(position: .trailing) {
                                Text(String(format: "%.0f%%", item.count))
                                    .foregroundColor(Color.primary)
                                    .font(.system(size: 9, weight: .regular))
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
                    .font(.system(size: 12))
                    .offset(x:-4)
            }
        }
        .chartXAxis {
            AxisMarks() { _ in
            }
        }
        .chartXScale(domain: 0...110)
        .frame(width: .infinity, height: 292)
                
    }
    
    struct ResultGraph_Previews: PreviewProvider {
        static var previews: some View {
            ResultGraph()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Graph")
        }
    }
}



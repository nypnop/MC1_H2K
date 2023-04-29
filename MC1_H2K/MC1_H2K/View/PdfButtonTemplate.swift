//
//  PdfButtonTemplate.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI
struct PdfButtonTemplate: ButtonStyle {
    var width:CGFloat
    var height:CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption2)
            .bold()
            .frame(width: width, height: height)
            .foregroundColor(Color("teal500"))
            .background(RoundedRectangle(cornerRadius:14).fill(Color("teal50")))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color("teal500"))
            )
    }
    
}


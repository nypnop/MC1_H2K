//
//  BigButtonTemplate.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct BigButtonTemplate: ButtonStyle {
    var width:CGFloat
    var height:CGFloat
    var isAll: Bool
    
    //2. Configuration parameter basically the button it self in this example
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .frame(width: width, height: height)
            .padding([.top,.bottom])
            .foregroundColor(isAll ? .white : .gray)
            .background(RoundedRectangle(cornerRadius:20).fill(Color(UIColor(named: isAll ? "teal500" : "teal900")!)))
            .padding(.top,70)
            .scaleEffect(configuration.isPressed && isAll ? 0.8 : 1.0)
    }
    
}

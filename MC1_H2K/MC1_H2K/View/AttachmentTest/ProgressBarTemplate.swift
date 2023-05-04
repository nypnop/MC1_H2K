//
//  ProgressBarTemplate.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct ProgressBarTemplate: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(.white)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor(named: "teal500")!))
            }
            
        }
    }
}

struct ProgressBarTemplate_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarTemplate(value: .constant(10))
    }
}


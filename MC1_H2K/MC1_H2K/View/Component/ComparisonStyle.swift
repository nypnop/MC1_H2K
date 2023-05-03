//
//  ComparisonStyle.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 03/05/23.
//

import SwiftUI

struct ComparisonStyle: View {
    @Binding var styleName: String
    @Binding var imageName: String
    @State var styleTitle: String = "Attachment Style"
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 32)
                VStack(alignment: .leading){
                    Text(styleName)
                        .font(.body)
                        .bold()
                    Text(styleTitle)
                        .foregroundColor(Color("GrayLight"))
                        .font(.caption)
                }
            }
            HStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 32)
                VStack(alignment: .leading){
                    Text(styleName)
                        .font(.body)
                        .bold()
                    Text(styleTitle)
                        .foregroundColor(Color("GrayLight"))
                        .font(.caption)
                }
            }
        }
    }
}

struct ComparisonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonStyle(styleName: .constant("Avoidant"), imageName: .constant("Avatar-FA"))
    }
}

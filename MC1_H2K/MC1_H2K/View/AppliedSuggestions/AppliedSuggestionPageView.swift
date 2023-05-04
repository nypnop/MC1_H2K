//
//  AppliedSuggestionPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 03/05/23.

import SwiftUI

struct AppliedSuggestionPageView: View {
    @State var styleName : String = "Fearful-Avoidant"
    @State var imageName : String = "Avatar-FA"
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        Text("Improve your communication with your parent/child!")
                            .font(.caption)
                            .foregroundColor(Color("GrayLight"))
                        Spacer()
                    }
                    ComparisonStyle(styleName: "$styleName", otherStyleName: "$styleName", otherimageName: $imageName, imageName: $imageName)
                }.padding(.horizontal, 16)
                .navigationBarTitle("Applied Suggestion")
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct AppliedSuggestionPageView_Previews: PreviewProvider {
    static var previews: some View {
        AppliedSuggestionPageView()
    }
}

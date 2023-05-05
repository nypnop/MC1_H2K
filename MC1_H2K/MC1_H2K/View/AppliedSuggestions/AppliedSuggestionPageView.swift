//
//  AppliedSuggestionPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 03/05/23.
//
import SwiftUI

struct AppliedSuggestionPageView: View {
    @State var styleName : String = "Fearful-Avoidant"
    @State var imageName : String = "Avatar-FA"
    @State var cards = [
        ("Title 1", "List", "Description 1","ConversationStarter"),
        ("Title 2", "Telphone Sekarang", "Description 2","whatsapp://"),
        ("Title 3", "Pesan Gojek Food", "Description 3","gojek://"),
        ("Title 3", "Pesan Grab Food", "Description 3","grab://"),
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        Text("Improve your communication with your parent/child!")
                            .font(.caption)
                            .foregroundColor(Color("GrayLight"))
                        Spacer()
                    }.padding(.horizontal, 24)
                        .padding(.bottom)
                    ComparisonStyle(styleName: styleName, otherStyleName: styleName, otherimageName: imageName, imageName: imageName)
                        .padding(.horizontal, 24)
                        .padding(.bottom)
                    VStack {
                        ForEach(cards.indices, id: \.self) { index in
                            SuggestionCard(CardTitle: $cards[index].0, CardAction: $cards[index].1, CardDescription: $cards[index].2, CardLink: $cards[index].3)
                        }
                        
                    }
                }
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

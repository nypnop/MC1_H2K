//
//  AppliedSuggestionPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 03/05/23.
//
import SwiftUI

struct AppliedSuggestionPageView: View {
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
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
                    ComparisonStyle(styleName: !comp.isEmpty ? comp[0].yourAS ?? "Not Found" : "Not Found", otherStyleName: !comp.isEmpty ? comp[0].otherAS ?? "Not Found" : "Not Found", otherimageName: !comp.isEmpty ? comp[0].image2 ?? "Not Found" : "Not Found", imageName: !comp.isEmpty ? comp[0].image ?? "Not Found" : "Not Found")
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

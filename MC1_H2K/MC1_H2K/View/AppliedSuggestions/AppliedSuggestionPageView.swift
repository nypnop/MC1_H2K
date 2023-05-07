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
    @StateObject var viewModel = AppliedViewModel()
//    public var card: [(String,String,String,String)]
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
                        ForEach(viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: !comp.isEmpty ? comp[0].role ?? "" : "").indices, id: \.self) { index in
                            SuggestionCard(CardTitle: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].0, CardAction: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].1, CardDescription: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].2, CardLink: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].3)
                        }
                    }
                }
                .navigationBarTitle("Applied Suggestion")
            }
            
        }
    }
}

struct AppliedSuggestionPageView_Previews: PreviewProvider {
    static var previews: some View {
        AppliedSuggestionPageView()
    }
}

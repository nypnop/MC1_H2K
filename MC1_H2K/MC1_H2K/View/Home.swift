//
//  Home.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 02/05/23.
//

import SwiftUI
import Charts

struct Home: View{
    
    @State var isDataAvailable : Bool = false
    @Binding var selection: Int
    var body: some View{
        VStack{
            if isDataAvailable{
                HomeView(selection: $selection)
            }
            else{
                SecondHomeView(selection: $selection)
            }
        }
    }
}
struct HomeView: View{
    
    @Binding var selection: Int
    
    var body: some View{
        VStack{

            
            //Illustration Image
            Image("Avatar-AX")
                .resizable()
                .frame(width: 240, height: 240)
                .padding()
            
            //Text
            Text("You have not taken the test yet!")
                .font(.title3.bold())
                
            
            //Sub-Text
            Text("Click the button below to take the test")
                .font(.body)
                .foregroundColor(Color("GrayLight"))
                
            
            //Take Test Button
            Button(action: {}) {
                NavigationLink(destination: HomeTestPageView(selection: $selection)){
                    Label("Start the Test", image: "Icon")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Color("teal500")
                        )
                        .cornerRadius(13)
                }
                    
            }
        }
    }
}

struct SecondHomeView: View{
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
    @StateObject var viewModel = AppliedViewModel()
    @Binding var selection: Int
    
    var body: some View{
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    HStack{
                        //Your Attachment Style
                        Text("Your Attachment Style")
                            .font(.title3)
                            .bold()
                        
                        //See More Button
                        Button {
                            selection = 2
                            print(selection)
                        } label: {
                            Text("See More")
                                .font(.caption)
                                .foregroundColor(Color("teal600"))
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    //Child Attachment Style
                    HStack(){
                        Image("\(!comp.isEmpty ? comp[0].image ?? "Not Found" : "Not Found")")
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        VStack(alignment: .leading){
                            Text("\(!comp.isEmpty ? comp[0].yourAS ?? "Not Found" : "Not Found")")
                                .font(.body)
                            
                            Text("\(!comp.isEmpty ? comp[0].role ?? "Children" : "Children") Attachment Style")
                                .font(.caption)
                                .foregroundColor(Color("GrayLight"))
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    
                    HStack{
                        //Compatibility with Other
                        Text("Compatibility with Other")
                            .font(.title3)
                            .bold()
                        
                        //See More Button
                        Button {
                            selection = 3
                            print(selection)
                        } label: {
                            Text("See More")
                                .font(.caption)
                                .foregroundColor(Color("teal600"))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    
                    //Parent Attachment Style
                    HStack(){
                        Image("\(!comp.isEmpty ? comp[0].image2 ?? "Not Found" : "Not Found")")
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        VStack(alignment: .leading){
                            Text("\(!comp.isEmpty ? comp[0].otherAS ?? "Not Found" : "Not Found")")
                                .font(.body)
                            
                            Text("\(!comp.isEmpty && comp[0].role=="Children" ? "Parent" : "Children" ) Attachment Style")
                                .font(.caption)
                                .foregroundColor(Color("GrayLight"))
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    
                    //Compatibility Rate Text
                    Text("Compatibility Rate")
                        .font(.caption)
                        .foregroundColor(Color("GrayLight"))
                        .padding(.horizontal, 24)
                        .padding(.top)
                    
                    //Compatibility Rate Chart
                    CompatibilityRate()
                    
                    HStack(){
                        //Suggestion Text
                        Text("Suggestions")
                            .font(.title3)
                            .bold()
                        
                        //See More Button
                        Button {
                            selection = 4
                            print(selection)
                        } label: {
                            Text("See More")
                                .font(.caption)
                                .foregroundColor(Color("teal600"))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    //Suggestion Box
                    
                    
                    
                        VStack {
                            ForEach(viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: !comp.isEmpty ? comp[0].role ?? "" : "").indices, id: \.self) { index in
                                SuggestionCard(CardTitle: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].0, CardAction: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].1, CardDescription: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].2, CardLink: viewModel.randomSuggestion(aS: !comp.isEmpty ? comp[0].yourAS ?? "" : "" ,role: "Children")[index].3)
                                
                            }
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Summary")
            .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            SecondHomeView(selection: Binding.constant(0))
        }
    }
}

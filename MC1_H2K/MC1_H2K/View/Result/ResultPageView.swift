//
//  ResultPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultPageView: View {
    @FetchRequest(entity: ResultData.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var resultData: FetchedResults<ResultData>
    @StateObject var viewModel = ResultViewModel()
    @State private var index = 0
    public init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor(named: "teal600")!
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
    }
    var body: some View {
        NavigationView{
            VStack{
                Image(!resultData.isEmpty && resultData[0].type == "Secure" ? "Avatar-SE" : !resultData.isEmpty && resultData[0].type == "Anxious" ? "Avatar-AX" : !resultData.isEmpty && resultData[0].type == "Fearful-Avoidant" ? "Avatar-FA" : !resultData.isEmpty && resultData[0].type == "Dismissive Avoidant" ? "Avatar-DA" : "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .overlay(alignment: .bottomTrailing){
                        Button(action: {
                            
                        }){
                            Label("Export to PDF", systemImage: "square.and.arrow.up.fill")
                        }
                        .buttonStyle( PdfButtonTemplate(width: 111, height:24) )
                        .padding(.bottom,15)
                        .offset(x: 80)
                    }
                Text(!resultData.isEmpty ? resultData[0].type ?? "Not Found" : "Not Found")
                    .font(.body)
                    .bold()
                    .padding(.top,10)
                Text("Attachment Style")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                //PICKER TAB SEGMENT
                Picker(
                    selection:$index,
                    label: Text("Picker"),
                    content: {
                        Text("Description").tag(0)
                        Text("Graph").tag(1)
                        Text("History").tag(2)
                    })
                .background(Color("teal25"))
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.top)
            }
            ScrollView{
                VStack{
                    VStack{
                        Image(!resultData.isEmpty && resultData[0].type == "Secure" ? "Avatar-SE" : !resultData.isEmpty && resultData[0].type == "Anxious" ? "Avatar-AX" : !resultData.isEmpty && resultData[0].type == "Fearful-Avoidant" ? "Avatar-FA" : !resultData.isEmpty && resultData[0].type == "Dismissive Avoidant" ? "Avatar-DA" : "")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
                            .overlay(alignment: .bottomTrailing){
                                Button(action: {
                                    
                                }){
                                    Label("Export to PDF", systemImage: "square.and.arrow.up.fill")
                                }
                                .buttonStyle( PdfButtonTemplate(width: 111, height:24) )
                                .padding(.bottom,15)
                                .offset(x: 80)
                            }
                            .onAppear() {
                                print(resultData)
                                print("resultData[0].type")
                            }
                        Text(!resultData.isEmpty ? resultData[0].type ?? "Not Found" : "Not Found")
                            .font(.body)
                            .bold()
                            .padding(.top,10)
                        Text("Attachment Style")
                            .font(.caption)
                            .foregroundColor(Color("GrayLight"))
                        //PICKER TAB SEGMENT
                        Picker(
                            selection:$index,
                            label: Text("Picker"),
                            content: {
                                Text("Description").tag(0)
                                Text("Graph").tag(1)
                                Text("History").tag(2)
                            })
                        .background(Color("teal25"))
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    if index == 0{
                        ResultDescription(type: !resultData.isEmpty ? String(resultData[0].type ?? "Not Found") : "")
                    }
                    else if index == 1{
                        ResultGraph(secure: !resultData.isEmpty ? resultData[0].secure : 0, avoidant: !resultData.isEmpty ? resultData[0].avoidant : 0, anxious: !resultData.isEmpty ? resultData[0].anxious : 0, disorganize: !resultData.isEmpty ? resultData[0].disorganize : 0)
                    }else{
                        ResultHistory()
                    }
                }
            }.navigationTitle("Attachment Style Result")
        }
    }
}

struct ResultPageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultPageView()
    }
}

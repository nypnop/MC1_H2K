//
//  ResultPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 29/04/23.
//

import SwiftUI

struct ResultPageView: View {
    @State private var index = 0
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor(named: "teal600")!
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
    }
    var body: some View {
        VStack{
            VStack{
                Image("Avatar-FA")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .overlay(alignment: .bottomTrailing){
                        Button(action: {
                            
                        }){
                            Label("Expore To PDF", systemImage: "square.and.arrow.up.fill")
                        }
                        .buttonStyle( PdfButtonTemplate(width: 111, height:24) )
                        .padding(.bottom,15)
                        .offset(x: 80)
                    }
                Text("Fearful-Avoidant")
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
                if index == 0{
                    ResultDescription()
                }
                else if index == 1{
                    ResultGraph()
                }else{
                    ResultHistory()
                }
            }
        }
        .padding(.top,32)
        .padding(.horizontal,8)
        .navigationTitle("Attachment Style Result")
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ResultPageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultPageView()
    }
}

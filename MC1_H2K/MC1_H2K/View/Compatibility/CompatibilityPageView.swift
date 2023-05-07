//
//  CompatibilityPageView.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.

import SwiftUI

struct CompatibilityPageView: View {
    @State private var compatibilitySegment = 0
    @Binding var selection: Int
    @FetchRequest(entity: ResultData.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var resultData: FetchedResults<ResultData>
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
//    public init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
//        let attributes: [NSAttributedString.Key:Any] = [
//            .foregroundColor: UIColor(named: "teal600")!
//        ]
//        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
//    }
    var body: some View {
        NavigationView {
            if !resultData.isEmpty {
                ScrollView{
                    VStack{
                        VStack(alignment: .leading){
            
                            HStack{
                                Text("See your relationship compatibility with your parent/child!")
                                    .font(.caption)
                                    .foregroundColor(Color("GrayLight"))
                                Spacer()
                            }
                            .padding(.horizontal,16)
                            //PICKER TAB SEGMENT
                            Picker(
                                selection:$compatibilitySegment,
                                label: Text("Picker"),
                                content: {
                                    Text("Input").tag(0)
                                    Text("Result").tag(1)
                                    Text("History").tag(2)
                                })
                            .background(Color("teal25"))
                            .pickerStyle(.segmented)
                            .padding(.top,12)
                            .padding(.horizontal,16)
                        }
                        
                        if compatibilitySegment == 0{
                            CompatibilityInput(selection: $compatibilitySegment)
                        }
                        else if compatibilitySegment == 1{
                            CompatibilityResult(selection: $selection)
                        }else{
                            CompatibilityHistory()
                        }
                    }
                }.navigationBarTitle("Compatibility")
            } else {
                HomeView(selection: $selection)
            }
        }
    }
}

struct CompatibilityPageView_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityPageView(selection: .constant(4))
    }
}

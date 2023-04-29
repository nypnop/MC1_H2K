//
//  TestPageView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct TestPageView: View {
    @State var progressValue: Float=0.2
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 32, pinnedViews: [.sectionHeaders, .sectionFooters]){
                Section(header: ProgressBarTemplate(value: $progressValue).frame(height:4), footer: FooterView()){
                    ForEach((1...5), id: \.self) {
                        QuestionView(number: $0)
                    }
                    .padding(.bottom,-32)
                }
            }
        }
        
        .navigationTitle("Attachment Style Test")
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}

//struct HeaderView: View {
//    var body: some View{
//        ProgressBarTemplate(value: $progressValue).frame(height:4)
//    }
//}

struct FooterView: View {
    var body: some View{
        VStack {
            Button(action: {}) {
                Label("Submit", image: "check")
            }
            .padding(.bottom,28)
            .padding(.top,-50)
            .padding([.trailing,.leading],40)
            .buttonStyle( BigButtonTemplate(width: 342, height:25))
            .background(.white)
        }
    }
}

//
//  TestPageView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct TestPageView: View {
    @State var progressValue: Float=0.5
    @State var isSubmit: Bool = false
    @State var size: Double = 0.5
    @State var opacity: Double = 0.5
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 32, pinnedViews: !isSubmit ? [.sectionHeaders, .sectionFooters]:.sectionHeaders){
                Section(header: ProgressBarTemplate(value: $progressValue).frame(height:4), footer:FooterView(isSubmit: $isSubmit,progressValue: $progressValue).opacity(!isSubmit ? 1 : 0)){
                    if(!isSubmit){
                        ForEach((1...5), id: \.self) {
                            QuestionView(number: $0)
                        }
                        .padding(.bottom,-32)
                    } else {
                        Group {
                            LottieView(
                                name:"done",
                                loopMode: .loop
                            )
                            .frame(width: 300,height: 300)
                            .scaledToFit()
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)){
                                    self.size = 1.0
                                    self.opacity = 1.0
                                }
                            }
                            .padding(.top,140)
                            Button(action: {
            
                            }) {
                                Label("Go To Result", image: "back-icon")
                            }
                            .buttonStyle(BigButtonTemplate(width: 300, height:25))
                            .padding(.top,-140)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
        .navigationTitle("Attachment Style Test")
        .edgesIgnoringSafeArea(.bottom)
//        else {
//            LazyVStack(alignment: .center, spacing: 32, pinnedViews: .sectionHeaders){
//                Section(header: ProgressBarTemplate(value: $progressValue).frame(height:4)){
                    
//                }
//            }
            
//        }
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}

struct FooterView: View {
    @Binding var isSubmit: Bool
    @Binding var progressValue: Float
    var body: some View{
        VStack {
            Button(action: {
                isSubmit=true
                progressValue=1.0
            }) {
                Label("Submit", image: "check-icon")
            }
            .padding(.bottom,28)
            .padding(.top,-50)
            .padding([.trailing,.leading],40)
            .buttonStyle( BigButtonTemplate(width: 342, height:25))
            .background(.white)
            
        }
        
    }
}

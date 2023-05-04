//
//  QuestionTemplate.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct QuestionView: View {
    var number:Int
    var questionPrompt:String
    var tags:String
    @State var isClick:Bool = false
    @Binding var progressValue:Double
    @Binding var progressPercantage:Float
    
    var body: some View {
        HStack{
            VStack(spacing:0){
                Circle()
                    .strokeBorder(Color(UIColor(named: "teal500")!),lineWidth: 1)
                    .frame(width: 24,height: 24)
                    .foregroundColor(Color(UIColor(named: "teal25")!))
                    .overlay(
                        Text("\(number)")
                            .font(.caption)
                            .foregroundColor(Color(UIColor(named: "teal600")!))
                    )
                Rectangle()
                    .frame(width: 3)
                    .foregroundColor(Color(UIColor(named: "teal100")!))
            }.padding(.trailing,5)
            VStack{
                VStack {
                    HStack {
                        Text(questionPrompt)
                            .font(.subheadline)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom,1)
                        Spacer()
                    }
                    Group{
                        HStack {
                            VStack {
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                        progressPercantage = Float(progressValue/40)
                                        print(progressValue)
                                        print(progressValue/40)
                                    }
                                } label:{
                                    Text("Disagree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.red)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.red).opacity(0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.red)
                                        )
                                }
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                        progressPercantage = Float(progressValue/40)
                                        print(progressValue)
                                        print(progressValue/40)
                                    }
                                } label:{
                                    Text("Mostly Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.blue)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.blue).opacity(0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.blue)
                                        )
                                }
                                
                            }
                            VStack {
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                        progressPercantage = Float(progressValue/40)
                                        print(progressValue)
                                        print(progressValue/40)
                                    }
                                } label:{
                                    Text("Sometimes Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
//                                        .padding([.trailing,.leading],18)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.orange)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.orange).opacity(0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.orange)
                                        )
                                }
                                
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                        progressPercantage = Float(progressValue/40)
                                        print(progressValue)
                                        print(progressValue/40)
                                    }
                                } label:{
                                    Text("Strongly Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.green)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.green).opacity(0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.green)
                                        )
                                }
                                
                            }
                        }
                    }
                }
                .padding(.vertical,18)
                .padding(.horizontal,16)
                .frame(width: 302)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor(named: "teal500")!), lineWidth: 2))
                Spacer()
            }
        }
        .frame(width: 342)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(number: 1, questionPrompt: "Saya mengutamakan kemandirian, saya memiliki kesulitan meminta bantuan ketika dibutuhkan, dan kebanyakan hobi saya kerjakan sendiri.", tags: "secure", isClick: false, progressValue: Binding.constant(1), progressPercantage: Binding.constant(0.0))
    }
}


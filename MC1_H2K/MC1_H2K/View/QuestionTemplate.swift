//
//  QuestionTemplate.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct QuestionView: View {
    var number:Int
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
                    .frame(width: 3,height: 144)
                    .foregroundColor(Color(UIColor(named: "teal100")!))
            }.padding(.trailing,5)
            VStack{
                VStack {
                    HStack {
                        Text("I feel anjing")
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
                .frame(width: 302, height: 154)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor(named: "teal500")!), lineWidth: 2))
                Spacer()
            }
        }
        .frame(width: 342, height: 170)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(number: 1)
    }
}


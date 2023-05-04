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
    @State var isD:Bool = false
    @State var isA:Bool = false
    @State var isSA:Bool = false
    @State var isMA:Bool = false
    @Binding var progressValue:Double
    @Binding var progressPercantage:Float
    @Binding var secure: Int64
    @Binding var avoidant: Int64
    @Binding var anxious: Int64
    @Binding var disorganize: Int64
    let point: Int = 0
    
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
                                    }
                                    isD.toggle()
                                    isA = false
                                    isMA = false
                                    isSA = false
                                    if isD {
                                        if tags == "secure" {
                                            secure += 1
                                        } else if tags == "avoindant" {
                                            avoidant += 1
                                        } else if tags == "anxious" {
                                            anxious += 1
                                        } else if tags == "disorganize" {
                                            disorganize += 1
                                        }
                                    } else {
                                        isClick = false
                                        progressValue -= 1
                                        if tags == "secure" {
                                            secure -= 1
                                        } else if tags == "avoindant" {
                                            avoidant -= 1
                                        } else if tags == "anxious" {
                                            anxious -= 1
                                        } else if tags == "disorganize" {
                                            disorganize -= 1
                                        }
                                    }
                                    progressPercantage = Float(progressValue/40)
                                    print(progressValue)
                                    print(progressValue/40)
                                } label:{
                                    Text("Disagree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(isD ? .white : .red)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.red).opacity(isD ? 1 : 0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.red)
                                        )
                                        .animation(.easeInOut(duration: 0.4), value: isD)
                                }
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                        progressPercantage = Float(progressValue/40)
                                        print(progressValue)
                                        print(progressValue/40)
                                    }
                                    isD = false
                                    isA = false
                                    isMA.toggle()
                                    isSA = false
                                    if isMA {
                                        if tags == "secure" {
                                            secure += 3
                                        } else if tags == "avoindant" {
                                            avoidant += 3
                                        } else if tags == "anxious" {
                                            anxious += 3
                                        } else if tags == "disorganize" {
                                            disorganize += 3
                                        }
                                    } else {
                                        isClick = false
                                        progressValue -= 1
                                        if tags == "secure" {
                                            secure -= 3
                                        } else if tags == "avoindant" {
                                            avoidant -= 3
                                        } else if tags == "anxious" {
                                            anxious -= 3
                                        } else if tags == "disorganize" {
                                            disorganize -= 3
                                        }
                                    }
                                    progressPercantage = Float(progressValue/40)
                                    print(progressValue)
                                    print(progressValue/40)
                                } label:{
                                    Text("Mostly Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(isMA ? .white : .blue)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.blue).opacity(isMA ? 1 : 0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.blue)
                                        )
                                        .animation(.easeInOut(duration: 0.4), value: isMA)
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
                                    isD = false
                                    isA.toggle()
                                    isMA = false
                                    isSA = false
                                    if isA {
                                        if tags == "secure" {
                                            secure += 2
                                        } else if tags == "avoindant" {
                                            avoidant += 2
                                        } else if tags == "anxious" {
                                            anxious += 2
                                        } else if tags == "disorganize" {
                                            disorganize += 2
                                        }
                                    } else {
                                        isClick = false
                                        progressValue -= 1
                                        if tags == "secure" {
                                            secure -= 2
                                        } else if tags == "avoindant" {
                                            avoidant -= 2
                                        } else if tags == "anxious" {
                                            anxious -= 2
                                        } else if tags == "disorganize" {
                                            disorganize -= 2
                                        }
                                    }
                                    progressPercantage = Float(progressValue/40)
                                    print(progressValue)
                                    print(progressValue/40)
                                } label:{
                                    Text("Sometimes Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
//                                        .padding([.trailing,.leading],18)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(isA ? .white : .orange)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.orange).opacity(isA ? 1 : 0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.orange)
                                        )
                                        .animation(.easeInOut(duration: 0.4), value: isA)
                                }
                                
                                Button{
                                    if !isClick {
                                        isClick = true
                                        progressValue += 1
                                    }
                                    isD = false
                                    isA = false
                                    isMA = false
                                    isSA.toggle()
                                    if isSA {
                                        if tags == "secure" {
                                            secure += 4
                                        } else if tags == "avoindant" {
                                            avoidant += 4
                                        } else if tags == "anxious" {
                                            anxious += 4
                                        } else if tags == "disorganize" {
                                            disorganize += 4
                                        }
                                    } else {
                                        isClick = false
                                        progressValue -= 1
                                        if tags == "secure" {
                                            secure -= 4
                                        } else if tags == "avoindant" {
                                            avoidant -= 4
                                        } else if tags == "anxious" {
                                            anxious -= 4
                                        } else if tags == "disorganize" {
                                            disorganize -= 4
                                        }
                                    }
                                    progressPercantage = Float(progressValue/40)
                                    print(progressValue)
                                    print(progressValue/40)
                                    print(secure)
                                } label:{
                                    Text("Strongly Agree")
                                        .frame(width: 130,height:20)
                                        .padding([.top,.bottom],8)
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(isSA ? .white : .green)
                                        .background(RoundedRectangle(cornerRadius: 30).fill(.green).opacity(isSA ? 1 : 0.15))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.green)
                                        )
                                        .animation(.easeInOut(duration: 0.4), value: isSA)
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
        QuestionView(number: 1, questionPrompt: "Saya mengutamakan kemandirian, saya memiliki kesulitan meminta bantuan ketika dibutuhkan, dan kebanyakan hobi saya kerjakan sendiri.", tags: "secure", isClick: false, progressValue: Binding.constant(1), progressPercantage: Binding.constant(0.0), secure: Binding.constant(0), avoidant: Binding.constant(0), anxious: Binding.constant(0), disorganize: Binding.constant(0))
    }
}


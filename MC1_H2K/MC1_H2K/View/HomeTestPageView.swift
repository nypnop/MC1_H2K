//
//  HomeTestPageView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

import SwiftUI

struct HomeTestPageView: View {
    @Environment(\.managedObjectContext) var testObjContext
    @State var placeholder = false
    var body: some View {
        NavigationView{
            VStack {
                Text("Attachment Style Test")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom,1)
                Text("Understand your Attachment Style")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.bottom,1)
                Text("Self-assesment")
                    .font(.system(size: 15))
                    .italic()
                    .bold()
                    .foregroundColor(Color(UIColor(named: "teal500")!))
                    .padding([.bottom,.top],10)
                    .padding([.trailing,.leading],20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(UIColor(named: "teal500")!), lineWidth: 1))
                    .padding(.bottom,15)
                        
                HStack{
                    HStack {
                        Image("q-iconbg")
                            .padding(.trailing,-2)
                        Text("30 question")
                            .font(.caption)
                            .foregroundColor(Color(UIColor(named: "teal900")!))
                    }
                    .padding()
                    .padding(.trailing,20)
                    HStack {
                        Image("time-icon")
                            .padding(.trailing,-2)
                        Text("~15 minutes")
                            .font(.caption)
                            .foregroundColor(Color(UIColor(named: "teal900")!))
                    }
                    .padding()
                    .padding(.leading,20)
                }
                VStack{
                    VStack {
                        HStack {
                            Text("About")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(UIColor(named: "teal600")!))
                                .padding([.top,.leading,.trailing])
                                .padding(.bottom,1)
                            Spacer()
                        }
                        Group{
                            HStack {
                                Text("Attachment style tests are psychological assessments designed to measure an individual's attachment style, which refers to the way a person relates to others in close relationships.")
                                    .padding(.bottom,1)
                                    .padding(.leading)
                                    .padding(.trailing,1)
                                Spacer()
                            }
                            HStack {
                                Text("Attachment style tests can be useful for individuals seeking to understand themselves and their relationships better.")
                                    .padding(.bottom)
                                    .padding(.leading)
                                    .padding(.trailing,1)
                                Spacer()
                            }
                        }
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                    }
                    .frame(width: 342, height: 199)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
                    
                    VStack {
                        HStack {
                            Text("Instructions")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color(UIColor(named: "teal600")!))
                                .multilineTextAlignment(.leading)
                                .padding([.top,.leading,.trailing])
                                .padding(.bottom,1)
                            Spacer()
                        }
                        Group{
                            HStack {
                                Text("• There is no right or wrong answer, choose the answer according to you")
                                    .padding(.leading,20)
                                    .padding(.trailing,1)
                                Spacer()
                            }
                            HStack {
                                Text("• Answer question as you are")
                                    .padding(.bottom)
                                    .padding(.leading,20)
                                    .padding(.trailing)
                                Spacer()
                            }
                        }
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                    }
                    .frame(width: 342, height: 99)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
                }
                Button(action: {}) {
                    NavigationLink(destination: TestPageView()){
                        Label("Start the Test", image: "Icon")
                    }
                        
                }
                .buttonStyle( BigButtonTemplate(width: 342, height:25) )
                TabView {
                        Text("")
                            .tabItem {
                                Image(systemName: "heart.fill")
                                Text("Favourites")
                        }
                        Text("")
                            .tabItem {
                                Image(systemName: "person.fill")
                                Text("Friends")
                        }
                        Text("")
                            .tabItem {
                                Image(systemName: "mappin.circle.fill")
                                Text("Nearby")
                        }
                }
            }
            .padding()
        }
    }
}

struct HTPView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTestPageView()
    }
}

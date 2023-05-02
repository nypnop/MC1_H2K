//
//  Home.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 02/05/23.
//

import SwiftUI

struct HomeView: View{
    var body: some View{
        VStack{
            //App Logo
            
            //Dark Mode Button
            
            //Illustration Image
            
            //Text
            
            //Sub-Text
            
            //Take Test Button
        }
    }
}

struct SecondHomeView: View{
    var body: some View{
        VStack{
            //App Logo
            
            //Dark Mode Button
            
            HStack{
                //Your Attachment Style
                
                //See More Button
            }
            
            //Child Attachment Style
            
            HStack{
                //Compatibility with Other
                
                //See More Button
            }
            
            //Parent Attachment Style
            
            //Compatibility Rate
            
            HStack{
                //Bar
                
                //Heart
            }
            
            HStack{
                //Suggestion Text
                
                //See More Button
            }
            
            //Suggestion Box
            VStack{
                VStack {
                    HStack {
                        Text("Perkuat Komunikasi")
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(UIColor(named: "teal600")!))
                            .padding(.horizontal)

                        Spacer()
                        
                        Button(action: {
                         //action
                        }, label: {
                            Text("Hubungi Sekarang")
                                .font(.caption2.bold())
                                .foregroundColor(Color("teal600"))
                                .padding()
                                .background(
                                Color("teal100")
                                    .cornerRadius(50)
                                )
                                
                                
                        })
                                
                    }
                    Group{
                        HStack {
                            Text("Lorem ipsum dolor sit amet consectetur. Risus lorem cursus mollis lectus id. Sed curabitur nibh purus semper nisi pellentesque pulvinar. Risus mattis morbi at sed odio pharetra. Condimentum consequat eget bibendum nam nec dolor a tellus venenatis. Vitae sodales commodo sodales etiam nascetur morbi.")
                                .padding(.bottom,1)
                                .padding(.leading)
                                .padding(.trailing,1)
                                .font(.caption)
                            Spacer()
                        }
                        
                    }
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                }
                .frame(width: .infinity, height: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
                    .padding()
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            SecondHomeView()
        }
    }
}

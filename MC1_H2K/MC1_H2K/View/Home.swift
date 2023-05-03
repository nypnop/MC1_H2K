//
//  Home.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 02/05/23.
//

import SwiftUI
import Charts

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
    
    @State var cards = [
        ("Title 1", "Action 1", "Description 1"),
        ("Title 2", "Action 2", "Description 2"),
        ("Title 3", "Action 3", "Description 3"),
        ("Title 4", "Action 4", "Description 4"),
        ("Title 5", "Action 5", "Description 5")
    ]
    
    var body: some View{
        NavigationView() {
            VStack(alignment: .leading){
                HStack{
                    //Your Attachment Style
                    Text("Your Attachment Style")
                        .font(.title3)
                        .bold()
                    
                    //See More Button
                    Text("See More")
                        .font(.caption)
                        .foregroundColor(Color("teal600"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                //Child Attachment Style
                HStack(){
                    Image("Avatar-FA")
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading){
                        Text("Fearful Avoidant")
                            .font(.body)
                        
                        Text("Child Attachment Style")
                            .font(.caption)
                            .foregroundColor(Color("GrayLight"))
                    }
                    
                }
                .padding(.horizontal, 24)
                
                HStack{
                    //Compatibility with Other
                    Text("Compatibility with Other")
                        .font(.title3)
                        .bold()
                    
                    //See More Button
                    Text("See More")
                        .font(.caption)
                        .foregroundColor(Color("teal600"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                
                //Parent Attachment Style
                HStack(){
                    Image("Avatar-DA")
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading){
                        Text("Dismissive-Avoidant")
                            .font(.body)
                        
                        Text("Parent Attachment Style")
                            .font(.caption)
                            .foregroundColor(Color("GrayLight"))
                    }
                    
                }
                .padding(.horizontal, 24)
                
                //Compatibility Rate Text
                Text("Compatibility Rate")
                    .font(.caption)
                    .foregroundColor(Color("GrayLight"))
                    .padding(.horizontal, 24)
                    .padding(.top)
                
                //Compatibility Rate Chart
                CompatibilityRate()
                
                HStack(){
                    //Suggestion Text
                    Text("Suggestions")
                        .font(.title3)
                        .bold()
                    
                    //See More Button
                    Text("See More")
                        .font(.caption)
                        .foregroundColor(Color("teal600"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                //Suggestion Box
                
                ScrollView {
                    VStack {
                        ForEach(cards.indices, id: \.self) { index in
                            SuggestionCard(actionTitle: $cards[index].0, action: $cards[index].1, actionDescription: $cards[index].2)
                        }
                    }
                }
            }
            
            .navigationTitle("Summary")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            SecondHomeView()
        }
    }
}

//
//  Home.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 02/05/23.
//

import SwiftUI
import Charts

struct Home: View{
    
    @State var isDataAvailable : Bool = false
    
    var body: some View{
        VStack{
            if isDataAvailable{
                HomeView()
            }
            else{
                SecondHomeView()
            }
        }
    }
}

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
        ("Title 1", "Action 1", "Description 1", "people://"),
        ("Title 2", "Action 2", "Description 2","https://wa.me/"),
        ("Title 3", "Action 3", "Description 3","https://grab.com/"),
        ("Title 4", "Action 4", "Description 4","https://gojek.com/"),
        ("Title 5", "Action 5", "Description 5","https://wa.me/")
    ]
    
    var body: some View{
        NavigationView() {
            ScrollView {
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
                    
                    
                    
                        VStack {
                            ForEach(cards.indices, id: \.self) { index in
                                SuggestionCard(CardTitle: $cards[index].0, CardAction: $cards[index].1, CardDescription: $cards[index].2, CardLink: $cards[index].3)
                                
                            }
                        
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Summary")
            .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            SecondHomeView()
        }
    }
}

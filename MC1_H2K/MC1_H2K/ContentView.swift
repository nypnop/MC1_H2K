//
//  ContentView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab){
                Home(selection: $selectedTab)
                    .tabItem{
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                    .tag(0)
                HomeTestPageView(selection: $selectedTab)
                    .tabItem{
                        Image(systemName: "questionmark.circle")
                        Text("Style Test")
                    }
                    .tag(1)
                ResultPageView()
                    .tabItem{
                        Image(systemName: "person.circle")
                        Text("Test Result")
                    }
                    .tag(2)
                CompatibilityPageView()
                    .tabItem{
                        Image(systemName: "heart.circle")
                        Text("Compatibility")
                    }
                    .tag(3)
                AppliedSuggestionPageView()
                    .tabItem{
                        Image(systemName: "hand.thumbsup.circle")
                        Text("Suggestion")
                    }
                    .tag(4)
            }
            .accentColor(Color("teal500"))
        .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

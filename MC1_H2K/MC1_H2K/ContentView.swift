//
//  ContentView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem{
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            HomeTestPageView()
                .tabItem{
                    Image(systemName: "questionmark.circle")
                    Text("Style Test")
                }
            ResultPageView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Test Result")
                }
            CompatibilityPageView()
                .tabItem{
                    Image(systemName: "heart.circle")
                    Text("Compatibility")
                }
            AppliedSuggestionPageView()
                .tabItem{
                    Image(systemName: "hand.thumbsup.circle")
                    Text("Suggestion")
                }
        }
        .accentColor(Color("teal500"))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            UserView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            PostView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Post")
                }
            LoginContentView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Post")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone 8")
        }
    }
}

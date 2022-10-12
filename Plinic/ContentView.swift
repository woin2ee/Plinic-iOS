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
            userContentView(nickName: "test")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchContentView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            postContentView(topNotice: "ppap")
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

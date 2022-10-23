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
            NavigationView{
                UserContentView(nickName: "Nickname")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            NavigationView{
                SearchContentView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            NavigationView{
                postContentView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Post")
            }
            NavigationView{
                LoginContentView()
            }
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

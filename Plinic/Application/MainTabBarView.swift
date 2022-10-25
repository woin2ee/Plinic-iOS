//
//  MainTabBarView.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/24.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            NavigationView{
                UserContentView()
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
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}

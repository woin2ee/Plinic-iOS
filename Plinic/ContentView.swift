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
                            Text("유저뷰")
                        }
                    postContentView(topNotice: "ppap")
                        .tabItem {
                            Image(systemName: "person")
                            Text("포스트")
                        }

                    SearchContentView()
                        .tabItem {
                            Image(systemName: "bag")
                            Text("서치")
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

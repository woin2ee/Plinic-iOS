//
//  ContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM = KakaoAuthVM.shared
    
    var body: some View {
        if kakaoAuthVM.isLogedIn {
            MainTabBarView()
        } else {
            LoginContentView()
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

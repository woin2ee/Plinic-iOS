//
//  loginButton.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/18.
//

import Foundation
import SwiftUI

struct LoginButton : View {
    
    @StateObject var kakaoAuthVM: KakaoAuthVM = KakaoAuthVM.shared
    
    var body: some View{
        VStack{
            Button(action: {
                kakaoAuthVM.handleKakaoLogin()
            }, label: {
                Image("kakao_login_large_wide")
            })
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

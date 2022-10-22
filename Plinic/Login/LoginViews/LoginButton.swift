//
//  loginButton.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/18.
//

import Foundation
import SwiftUI

//import KakaoSDKCommon
//import KakaoSDKAuth

struct LoginButton : View {
    
    @StateObject var kakoAuthVM: KakaoAuthVM = KakaoAuthVM()
    
    let loginStatusInfo : (Bool) -> String = { isLogedIn in
        return isLogedIn ? "로그인 상태" : "로그아웃 상태"
    }
    
    var body: some View{
        VStack{
            Button(action: {
                kakoAuthVM.handleKakaoLogin()
            }, label: {
                Image("kakao_login_large_wide")
            })
            Button(action: {
                kakoAuthVM.KakaoLogout()
            }, label: {
                Text("카카오 로그아웃")
            })
            Text(loginStatusInfo(kakoAuthVM.isLogedIn))
                .padding()
            // 로그인 상태를 보여주는 텍스트
        }
        
    }
    
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

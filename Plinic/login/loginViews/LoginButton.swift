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
    
    var body: some View{
        
        Button(action: {
            kakoAuthVM.handleKakaoLogin()
        }, label: {
            Image("kakao_login_medium_wide")
        })
    }
    
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

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
    
//    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    var body: some View{
        
        Button(action: {
            
        }, label: {
            Text("카카오 로그인")
//            Image("kakao_login_medium_wide")$
//                .resizable()
//                .aspectRatio(contentMode: .fill)
        })
    }
    
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

//
//  MySceneDelegate.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/09.
//

import Foundation
import UIKit
import RxKakaoSDKAuth
import KakaoSDKAuth


class MySceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.rx.handleOpenUrl(url: url)
            }
        }
    }
}

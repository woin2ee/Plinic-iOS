//
//  MyAppDelegate.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/09.
//

import Foundation
import UIKit
import RxKakaoSDKCommon
import RxKakaoSDKAuth
import KakaoSDKAuth

class MyAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // 메인번들에 있는 카카오 앱키 불러오기
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""

        // kakao SDK 초기화
        RxKakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                return AuthController.rx.handleOpenUrl(url: url)
            }

            return false
        }
    
    // appDelegate 에서 sceneDelegate 연결 하기
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

            let sceneConfigutation = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)

            sceneConfigutation.delegateClass = MySceneDelegate.self

            return sceneConfigutation
        }
    
}

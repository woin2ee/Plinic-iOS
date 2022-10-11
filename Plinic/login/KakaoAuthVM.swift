//
//  KakaoAuthVM.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/09.
//

import Foundation
import RxSwift
import Combine
import RxKakaoSDKAuth
import RxKakaoSDKUser
import KakaoSDKUser


class KakaoAuthVM: ObservableObject {
    // Class member property
    let disposeBag = DisposeBag()
    
    func handleKakaoLogin() {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.rx.loginWithKakaoTalk()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                })
                .disposed(by: disposeBag)
        } else { // 카카오톡이 설치가 안되어 있을 경우
            
            // 카카오 계정으로 로그인 하기 - 웹뷰를 열러서 로그인 하기
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}

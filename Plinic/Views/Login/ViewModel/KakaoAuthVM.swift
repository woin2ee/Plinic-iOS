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


final class KakaoAuthVM: ObservableObject {
    
    private let disposeBag = DisposeBag()
    
    static let shared: KakaoAuthVM = .init()
    
    @Published private(set) var isLogedIn: Bool = false
    
    private init() {}
    
    // MARK: - 카카오톡 로그인
    @MainActor
    func handleKakaoLogin() {
        Task{
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLogedIn = await handleLoginWithKakaoTalkApp()
            } else { // 카카오톡이 설치가 안되어 있을 경우
                isLogedIn = await handleWithKakaoAccount()
            }
        }
    }
    
    private func handleLoginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.rx.loginWithKakaoTalk()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoTalk() success.")
                    continuation.resume(returning: true)
                    //do something
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                    continuation.resume(returning: false)
                })
                .disposed(by: disposeBag)
        }
    }
    
    private func handleWithKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            // 카카오 계정으로 로그인 하기 - 웹뷰를 열러서 로그인 하기
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    continuation.resume(returning: true)
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    // MARK: - 카카오톡 로그아웃
    @MainActor
    func KakaoLogout() {
        Task{
            if await handleKakaoLogout() {
                isLogedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.rx.logout()
                .subscribe(onCompleted:{
                    print("logout() success.")
                    continuation.resume(returning: true)
                }, onError: {error in
                    print(error)
                    continuation.resume(returning: false)
                })
                .disposed(by: disposeBag)
        }
    }
}

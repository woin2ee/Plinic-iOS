//
//  PlaylistWebView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/31.
//

import SwiftUI
import WebKit

struct PlaylistWebView : UIViewRepresentable {
    
    // UIKit의 UIView를 사용할 수 있게 함
    
    var playlistURL : String
    
    func makeUIView(context: Context) -> some WKWebView {
        
        guard let plURL = URL(string: self.playlistURL) else {
            return WKWebView()
        } // 플레이리스트에 대한 URL 데이터 옵셔널 언래핑
        
        let playlistWebView = WKWebView()
        // playlistWebView 인스턴스 생성
        
        playlistWebView.load(URLRequest(url: plURL)) // playlistWebView를 로드
        
        return playlistWebView // playlistWebView 반환
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<PlaylistWebView>) {
        
    }
    
}

struct PlaylistWebView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistWebView(playlistURL: "https://www.naver.com")
        
    }
}


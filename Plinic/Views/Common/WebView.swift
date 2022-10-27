//
//  PlaylistWebView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/31.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    // UIKit의 UIView를 사용할 수 있게 함
    
    @Binding var requestURL : String
    
    func makeUIView(context: Context) -> some WKWebView {
        
        guard let url = URL(string: self.requestURL) else {
            return WKWebView()
        } // 플레이리스트에 대한 URL 데이터 옵셔널 언래핑
        
        let webView = WKWebView()
        // playlistWebView 인스턴스 생성
        
        webView.load(URLRequest(url: url)) // WebView를 로드
        
        return webView // WebView 반환
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<WebView>) {
        
    }
    
}

struct PlaylistWebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(requestURL: "http://www.youtube.com/watch_videos?video_ids=cPAbx5kgCJo")
    }
}


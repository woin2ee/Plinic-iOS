//
//  VideoBackgroundView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/18.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit



struct VideoBackgroundView : View {
    
    @StateObject var requestAPI: RequestAPI = RequestAPI()
    
    fileprivate var loopingVideoPlayerView: LoopingVideoPlayerView = LoopingVideoPlayerView()
    
    var body: some View {
        ZStack{
            loopingVideoPlayerView
            Color.black.opacity(0.2)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            requestAPI.getBackgroundVideo { result in
                switch result {
                case .success(let success): // 성공했을 때
                    loopingVideoPlayerView.loopingVideoPlayerUIView.videoURL = success
                    // LoopingVideoPlayerView()에 있는 videoURL 변수에 BackgroundVideo에 디코딩한 backgroundVideo 변수를 대입
                case .failure(let failure): // 실패했을 때
                    _ = failure
                }
            }
        }
    }
}

fileprivate struct LoopingVideoPlayerView : UIViewRepresentable {
    
    @StateObject var requestAPI: RequestAPI = RequestAPI()
    var loopingVideoPlayerUIView : LoopingVideoPlayerUIView = LoopingVideoPlayerUIView(frame: .zero)
    
    func makeUIView(context: Context) -> UIView {
        
        return loopingVideoPlayerUIView
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

/// 반복 비디오플레이어 UIView
fileprivate class LoopingVideoPlayerUIView : UIView {
    fileprivate var playerLayer = AVPlayerLayer()
    fileprivate var playerLooper : AVPlayerLooper?
    
    var videoURL : String {
        didSet { // 해당 변수가 변경될 때마다 실행되는 코드 , 초기화 필수
            // 바뀐 URL 로 재생시키는 코드
            
            guard let videoFileURL = URL(string: self.videoURL) else { return }
            let playerItem = AVPlayerItem(url: videoFileURL)
            
            // 플레이어 세팅
            let queuePlayer = AVQueuePlayer(playerItem: playerItem)
            queuePlayer.isMuted = true // 영상 소리 뮤트
            playerLayer.player = queuePlayer
            playerLayer.videoGravity = .resizeAspectFill
            
            DispatchQueue.main.async {
                self.layer.addSublayer(self.playerLayer)
            }
            
            // Create a new player looper with the queue player and template item
            playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
            
            // Begin looping playback
            queuePlayer.play()
        }
    }
    
    
    override init(frame: CGRect) {
        self.videoURL = "" // didSet 함수를 사용하기 위한 초기화
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct VideoBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        VideoBackgroundView()
    }
}

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
    var body: some View {
        ZStack{
            LoopingVideoPlayerView()
            Color.black.opacity(0.2)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

fileprivate struct LoopingVideoPlayerView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return LoopingVideoPlayerUIView(frame: .zero)
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

/// 반복 비디오플레이어 UIView
fileprivate class LoopingVideoPlayerUIView : UIView {
    fileprivate var playerLayer = AVPlayerLayer()
    fileprivate var playerLooper : AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: "bg_video", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: videoFileURL)
        
        // 플레이어 세팅
        let queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = queuePlayer
        playerLayer.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer)
        
        
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
         
        // Begin looping playback
        queuePlayer.play()
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

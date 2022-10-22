//
//  BackgroundVideo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/18.
//

import Foundation

struct BackgroundVideo: Codable {
    
    let backgroundVideo : String
    
    enum CodingKeys: String, CodingKey {
        case backgroundVideo = "background_url"
    }
}

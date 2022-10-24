//
//  BackgroundVideo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/18.
//

import Foundation

struct BackgroundVideo: Codable {
    
    let backgroundVideoURL : String
    
    enum CodingKeys: String, CodingKey {
        case backgroundVideoURL = "background_url"
    }
}

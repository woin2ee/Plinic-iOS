//
//  RandomThumbnail.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/25.
//

import Foundation

struct RandomThumbnail: Codable {
    
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "img_url"
    }
}

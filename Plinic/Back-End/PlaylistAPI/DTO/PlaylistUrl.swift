//
//  PlaylistUrl.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import Foundation

struct PlaylistUrl: Codable {
    let totalUrl: String
    
    enum CodingKeys: String, CodingKey {
        case totalUrl = "total_url"
    }
    
    static func createEmpty() -> Self {
        return .init(totalUrl: "")
    }
}

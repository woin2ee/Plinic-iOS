//
//  PlaylistUrl.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import Foundation

struct PlaylistUrl: Codable {
    var totalUrl: String
    
    enum CodingKeys: String, CodingKey {
        case totalUrl = "total_url"
    }
    
    static func createEmpty() -> Self {
        return .init(totalUrl: "")
    }
    
    static func createMock() -> Self {
        return .init(totalUrl: "https://www.youtube.com/watch?v=u-YGV5xt-jk&list=TLGGob0hFMpBKqQyNzEwMjAyMg")
    }
}

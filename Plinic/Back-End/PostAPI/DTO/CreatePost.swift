//
//  CreatePost.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import Foundation

struct CreatePost: Codable {
    let title: String
    let content: String
    let playlistID: Int
    let tagSet: [Int]
    
    enum CodingKeys: String, CodingKey {
        case title, content
        case playlistID = "playlist_id"
        case tagSet = "tag_set"
    }
    
    static func createMock() -> Self {
        return .init(
            title: "Test1",
            content: "test1",
            playlistID: 1,
            tagSet: []
        )
    }
}

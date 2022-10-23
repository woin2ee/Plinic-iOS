//
//  PostDetail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

struct PostDetail: Codable {
    let postID: Int
    let isUpdated: Bool
    let createdAt, updatedAt: String
    let tagSet: [String]
    var plInfo: PlaylistDetail
    let likerCount: Int
    let title, content: String
    let isLike: Bool
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case postID = "id"
        case isUpdated = "is_updated"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case tagSet = "tag_set"
        case plInfo = "playlist"
        case likerCount = "liker_count"
        case title, content
        case isLike = "is_like"
        case author
    }
    static func creatEmpty() -> PostDetail {
        return PostDetail(postID: 30, isUpdated: false, createdAt: "1111.11.11", updatedAt: "2222.22.22", tagSet: ["test1","test2"], plInfo: PlaylistDetail(id: 12, title: "Title", thumbnailImgURL: "asd", totalURL: "rasd", trackName: ["1", "2"], genreName: "Jazz", isScrapped: false, scrapperCount: 2), likerCount: 1, title: "Title", content: "This is content", isLike: false, author: "Nickname")
    }
}

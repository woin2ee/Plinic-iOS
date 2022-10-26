//
//  Post.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

struct Post: Codable {
    
    var uuid: UUID = .init()
    
    var author: Author
    let id : Int
    var likerCount: Int
    let title: String
    var isLike: Bool
    let content: String
    var plInfo: Playlist
    
    enum CodingKeys: String, CodingKey {
        case author
        case id = "id"
        case likerCount = "liker_count"
        case title
        case isLike = "is_like"
        case content
        case plInfo = "playlist_info"
    }
    
    static func createEmpty() -> Post {
        return Post(
            author: Author.init(nickname: "NickName", profilePic: "profileDefault"),
            id: -1,
            likerCount: 30,
            title: "Title",
            isLike: false,
            content: "This is content",
            plInfo: Playlist.init(id: 2, nickname: "Nickname", title: "Playlist Title", thumbnailImgURL: "defaultImg")
        )
    }
    
    static func createMock() -> Self {
        return .init(
            author: .createMock(),
            id: 1,
            likerCount: 3,
            title: "포스트 제목입니다",
            isLike: false,
            content: "포스트 내용입니다",
            plInfo: .createMock()
        )
    }
}

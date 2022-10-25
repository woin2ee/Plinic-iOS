//
//  Post.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

struct Post: Hashable ,Codable {
    
    var author: Author
    let id : Int
    let likerCount: Int
    let title: String
    let isLike: Bool
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
    
    static func creatEmpty() -> Post {
        return Post(
            author: Author.init(nickname: "NickName", profilePic: "random1"),
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(likerCount)
        hasher.combine(title)
        hasher.combine(isLike)
        hasher.combine(content)
    }
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    } // postID를 1:1 대응 시켜줌
}

//
//  UserInfo.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/23.
//

import Foundation

struct UserInfo: Codable {
    
    var uuid = UUID()
    
    let nickName: String
    let profileImageUrl: String
    
    let publicPlaylists: [briefPlaylistInfo]
    let privatePlaylists: [briefPlaylistInfo]
//    let scrappedPlaylists: [briefPlaylistInfo]
    
    let writtenPosts: [WrittenPostInfo]
    
    var wishGenres: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case nickName = "nickname"
        case profileImageUrl = "profile_img"
        
        case publicPlaylists = "public_playlists"
        case privatePlaylists = "private_playlists"
//        case scrappedPlaylists = "scrapped_playlists"
        
        case writtenPosts = "written_posts"
        
//        case wishGenres
    }
    
    static func createEmpty() -> Self {
        return .init(
            nickName: "",
            profileImageUrl: "",
            publicPlaylists: [],
            privatePlaylists: [],
            writtenPosts: [],
            wishGenres: []
        )
    }
    
    static func createMock() -> Self {
        return .init(
            nickName: "Lami",
            profileImageUrl: "http://35.79.181.245:8000/media/profiles/2022/10/24/lami_profile.jpg",
            publicPlaylists: [
                .init(title: "1", thumbnailUrl: "1", id: 1),
                .init(title: "2", thumbnailUrl: "1", id: 2),
                .init(title: "3", thumbnailUrl: "1", id: 3)
            ],
            privatePlaylists: [
                .init(title: "1", thumbnailUrl: "1", id: 1),
                .init(title: "2", thumbnailUrl: "1", id: 2),
                .init(title: "3", thumbnailUrl: "1", id: 3)
            ],
            writtenPosts: [
                .init(id: 1, title: "1", content: "11"),
                .init(id: 2, title: "2", content: "22"),
                .init(id: 3, title: "3", content: "33")
            ],
            wishGenres: [
                "장르111",
                "장르222",
                "장르333"
            ]
        )
    }
}

struct briefPlaylistInfo: Codable {
    
    var uuid = UUID()
    
    let title: String
    let thumbnailUrl: String
    let id: Int
}

struct WrittenPostInfo: Codable {
    
    var uuid = UUID()
    
    let id: Int
    let title: String
    let content: String
}

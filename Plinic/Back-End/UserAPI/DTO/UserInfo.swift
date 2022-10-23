//
//  UserInfo.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/23.
//

import Foundation

struct UserInfo: Codable {
    
    var uuid = UUID()
    let id: Int
    let nickName: String
    let profileImageUrl: String
    let myPlaylists: [String]
    let scrappedPlaylists: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case nickName = "nickname"
        case profileImageUrl = "profile_img"
        case myPlaylists = "my_playlists"
        case scrappedPlaylists = "scrapped_playlists"
    }
}

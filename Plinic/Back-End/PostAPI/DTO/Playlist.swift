//
//  Playlist.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

struct Playlist: Codable {
    
    let id: Int
    let nickname: String
    let title: String
    var thumbnailImgURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nickname
        case title
        case thumbnailImgURL = "thumbnail_img_url"
    }
    
    static func createMock() -> Self {
        return .init(
            id: 1,
            nickname: "Lami",
            title: "플레이리스트 제목!",
            thumbnailImgURL: "defaultImg"
        )
    }
}

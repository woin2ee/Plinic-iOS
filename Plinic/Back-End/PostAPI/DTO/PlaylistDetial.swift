//
//  PlaylistDetial.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

struct PlaylistDetail: Codable {
    let id: Int
    let title, thumbnailImgURL, totalURL: String
    let trackName: [String]
    let genreName: String
    let isScrapped: Bool
    let scrapperCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case thumbnailImgURL = "thumbnail_img_url"
        case totalURL = "total_url"
        case trackName = "track_name"
        case genreName = "genre_name"
        case isScrapped = "is_scrapped"
        case scrapperCount = "scrapper_count"
    }
}

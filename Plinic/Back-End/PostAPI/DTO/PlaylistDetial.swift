//
//  PlaylistDetial.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

struct PlaylistDetail: Codable {
    let id: Int
    let title: String
    let thumbnailImgURL: String?
    let totalURL: String
    let trackName: [String]
    let genreName: String
    let isScrapped: Bool
    let scrapperCount: Int
    let isPublic: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case thumbnailImgURL = "thumbnail_img_url"
        case totalURL = "total_url"
        case trackName = "track_name"
        case genreName = "genre_name"
        case isScrapped = "is_scrapped"
        case scrapperCount = "scrapper_count"
        case isPublic = "is_public"
    }
    
    static func createEmpty() -> Self {
        return .init(
            id: -1,
            title: "",
            thumbnailImgURL: "",
            totalURL: "",
            trackName: [],
            genreName: "",
            isScrapped: false,
            scrapperCount: 0,
            isPublic: true
        )
    }
    
    static func createMock() -> Self {
        return .init(
            id: 1,
            title: "🎄 Happy Christmas 🎄",
            thumbnailImgURL: "thumbnails/2022/10/24/육회_oxzz6kC.jpeg",
            totalURL: "https://www.youtube.com/watch?v=hDphjzXZW-4&list=TLGG-gDeQ2YlcRMyNDEwMjAyMg",
            trackName: ["1", "2"],
            genreName: "study",
            isScrapped: false,
            scrapperCount: 1,
            isPublic: true
        )
    }
}

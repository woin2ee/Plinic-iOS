//
//  RecentNotice.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

struct RecentNotice: Codable {
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
    }
    
    static func creatEmpty() -> RecentNotice {
        return RecentNotice(id: -1, title: "noticeTitle")
    }
}

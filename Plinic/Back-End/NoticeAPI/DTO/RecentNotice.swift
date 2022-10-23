//
//  RecentNotice.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

struct RecentNotice: Codable {
    let noticeID: Int
    let noticeTitle: String
    
    enum CodingKeys: String, CodingKey {
        case noticeID = "id"
        case noticeTitle = "title"
    }
    
    static func creatEmpty() -> RecentNotice {
        return RecentNotice(noticeID: -1, noticeTitle: "noticeTitle")
    }
}

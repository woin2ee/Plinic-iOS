//
//  Author.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

struct Author: Codable {
    
    let nickname: String
    var profilePic: String?
    
    enum CodingKeys: String, CodingKey {
        case nickname
        case profilePic = "profile_pic"
    }
    
    static func createMock() -> Self {
        return .init(
            nickname: "Lami",
            profilePic: "random1"
        )
    }
}

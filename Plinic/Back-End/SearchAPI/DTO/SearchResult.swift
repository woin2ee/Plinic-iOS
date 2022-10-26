//
//  SearchResult.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/26.
//

import Foundation

struct SearchResult: Codable {
    
    var users: [UserInfo]
    let posts: [Post]
    
    enum CodingKeys: String, CodingKey {
        case users
        case posts
    }
    
    static func createEmpty() -> Self {
        return .init(users: [.createEmpty()], posts: [.createEmpty()])
    }
    
    static func createMock() -> Self {
        return .init(
            users: [
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock()
            ],
            posts: [
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock()
            ]
        )
    }
}

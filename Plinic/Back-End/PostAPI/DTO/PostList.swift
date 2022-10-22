//
//  PostList.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/19.
//

import Foundation

struct PostList: Codable {
    
    let count: Int
    var next: String?
    var results: [Post]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
    
    static func create() -> PostList {
        // FIXME: Refactor
        return .init(count: 0, next: "http://35.79.181.245:8000/api/v1/plinic/posts/", results: [])
    }
}


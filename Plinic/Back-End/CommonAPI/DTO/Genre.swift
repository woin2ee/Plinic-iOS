//
//  Genre.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/24.
//

import Foundation

typealias Genres = [String]

//FIXME: - GenreAPI가 완성 되면 고쳐 쓸 부분 주석처리
//struct Genre: Codable {
//
//    let names: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case names = "genre_name"
//    }
//
//    static func createMock() -> Genre {
//        return Genre(
//            names: ["acoustic","blues","classical","jazz","children","disney","hip-hop","rock","j-pop","k-pop","new-age","opera","pop","reggae","tango","techno","singer-songwriter","r-n-b","british","disco","new-release","movies","soundtracks","edm","sleep","soul","study","summer","road-trip","rainy-day","dance","holidays","party","work-out","sad","romance"])
//    }
//}

extension Genres {
    static func createEmpty() -> Genres {
        return []
    }
    
    static func createMock() -> Genres {
        return ["acoustic","blues","classical","jazz","children","disney","hip-hop","rock","j-pop","k-pop","new-age","opera","pop","reggae","tango","techno","singer-songwriter","r-n-b","british","disco","new-release","movies","soundtracks","edm","sleep","soul","study","summer","road-trip","rainy-day","dance","holidays","party","work-out","sad","romance"]
    }
}

//
//  PostList.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/19.
//

import Foundation

// MARK: - PostList
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
        return .init(count: 0, next: "http://35.79.181.245:8000/api/v1/plinic/posts/", results: [])
        // MARK: - Refactor
    }
}

// MARK: - Post
struct Post: Hashable ,Codable {
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    } // id를 1:1 대응 시켜줌
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(likerCount)
        hasher.combine(title)
        hasher.combine(isLike)
        hasher.combine(content)
    }
    
    var author: Author
    let id : Int
    let likerCount: Int
    let title: String
    let isLike: Bool
    let content: String
    var playlist: Playlist

    enum CodingKeys: String, CodingKey {
        case author
        case id
        case likerCount = "liker_count"
        case title
        case isLike = "is_like"
        case content
        case playlist = "playlist_info"
    }
    
    static func creatEmpty() -> Post {
        return Post(author: Author.init(nickname: "NickName", profilePic: "random1"), id: -1, likerCount: 30, title: "Title", isLike: false, content: "This is content", playlist: Playlist.init(id: 2, nickname: "Nickname", title: "Playlist Title", thumbnailImgURL: "defaultImg"))
    }
}

// MARK: - Author
struct Author: Codable {
    let nickname: String
    var profilePic: String?

    enum CodingKeys: String, CodingKey {
        case nickname
        case profilePic = "profile_pic"
    }
}

// MARK: - PlaylistInfo
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
}


class PostListAPI: ObservableObject {
    
    private let postListURL : String = "http://35.79.181.245:8000/api/v1/plinic/posts/"
    
    func getPostList(nextURL: String?, _ completion: @escaping ((Result<PostList, Error>) -> Void)) {
        
        guard let requestUrl = nextURL else {
//            completion(.failure(<#T##Error#>))
            return
        }
        
//        let requestUrl: String
//
//        if let nextURL = nextURL { // next 이 있을 때 next으로 대체
//            requestUrl = nextURL
//        } else { // next 이 없을 때 첫번째 페이지인 URL을 사용
//            requestUrl = postListURL
//        }
        
        guard let url = URL(string: "\(requestUrl)") else {
            print("invalid URL")
            return
        }
        let session = URLSession(configuration: .default)
        let task = session .dataTask(with: url) {(data, response, error) in
            if error != nil{
                print(error!)
                completion(.failure(error!)) // 컴플리션 에러처리
                return
            }
            if let JSONdata = data {
                print(JSONdata)
                let dataString = String(data:JSONdata, encoding: .utf8)
                let decoder = JSONDecoder()
                do{
                    let decodeData = try decoder.decode(PostList.self, from: JSONdata)
                    completion(.success(decodeData))
                    // completion을 함수처럼 사용
                } catch {
                    print(error)
                    completion(.failure(error))
                    // 컴플리션 에러처리
                }
            }
        }
        task.resume()
    }
}

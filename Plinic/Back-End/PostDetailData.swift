//
//  PostDetailData.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/21.
//

import Foundation

// MARK: - PostDetailAPI
struct PostDetailAPI: Codable {
    let id: Int
    let isUpdated: Bool
    let createdAt, updatedAt: String
    let tagSet: [String]
    var plInfo: PlaylistDetail
    let likerCount: Int
    let title, content: String
    let isLike: Bool
    let author: String

    enum CodingKeys: String, CodingKey {
        case id
        case isUpdated = "is_updated"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case tagSet = "tag_set"
        case plInfo = "playlist"
        case likerCount = "liker_count"
        case title, content
        case isLike = "is_like"
        case author
    }
    static func creatEmpty() -> PostDetailAPI {
        return PostDetailAPI(id: 30, isUpdated: false, createdAt: "1111.11.11", updatedAt: "2222.22.22", tagSet: ["test1","test2"], plInfo: PlaylistDetail(id: 12, title: "Title", thumbnailImgURL: "asd", totalURL: "rasd", trackName: ["1", "2"], genreName: "Jazz", isScrapped: false, scrapperCount: 2), likerCount: 1, title: "Title", content: "This is content", isLike: false, author: "Nickname")
    }
}

// MARK: - Playlist
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


class PostDetailData: ObservableObject {
    
    private let postDetailURL : String = "http://35.79.181.245:8000/api/v1/plinic/posts/"
    
    func getPostDetail(postID: Int?,_ completion: @escaping ((Result<PostDetailAPI, Error>) -> Void)) {
// MARK: - Error : 내가 하고 싶은 것: postDetailURL에 postID를 집어넣어서 requestUrl를 만들어주고 그 값을 받아온다. 
        guard let requestUrl = "\(postDetailURL)\(postID)" else {

            return
        }
        
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
                    let decodeData = try decoder.decode(PostDetailAPI.self, from: JSONdata)
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

//
//  PostAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

final class PostAPI: ObservableObject {
    
    private let postListURL : String = "http://35.79.181.245:8000/api/v1/plinic/posts/"
    
    func getPostList(nextURL: String?, _ completion: @escaping ((Result<PostList, Error>) -> Void)) {
        
        guard let requestUrl = nextURL else {
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

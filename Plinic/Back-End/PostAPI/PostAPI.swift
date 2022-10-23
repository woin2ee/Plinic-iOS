//
//  PostAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

final class PostAPI: ObservableObject {
    
    private let postURL: String = "/plinic/posts/" // 게시물 목록(GET)
    //    private let postDetailURL : String = "/plinic/posts/30" // FIXME: - 게시물 상세(GET)
    private let networkService = NetworkService.init()
    
    
    
    // MARK: - 게시물 목록(GET)
    func getPostList(nextURL: String?, _ completion: @escaping ((Result<PostList, Error>) -> Void)) {
        if let absoluteURL = nextURL {
            networkService.request(absolutePath: absoluteURL) { result in
                switch result {
                case .success(let data):
                    do {
                        let postList = try JSONDecoder.init().decode(PostList.self, from: data)
                        completion(.success(postList))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            networkService.request(path: postURL) { result in
                switch result {
                case .success(let data):
                    do {
                        let postList = try JSONDecoder.init().decode(PostList.self, from: data)
                        completion(.success(postList))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - 게시물 상세(GET)
    func getPostDetail(postID: Int?, _ completion: @escaping ((Result<PostDetail, Error>) -> Void)) {
        // FIXME: - Error : 내가 하고 싶은 것: postDetailURL에 postID를 집어넣어서 requestUrl를 만들어주고 그 값을 받아온다.
        
        guard let postID = postID else {
            return
        }
        let postDetailURL = "http:/35.79.181.245:8000/api/v1" + postURL + "\(postID)"
        
        guard let url = URL(string: "\(postDetailURL)") else {
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
                    let decodeData = try decoder.decode(PostDetail.self, from: JSONdata)
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

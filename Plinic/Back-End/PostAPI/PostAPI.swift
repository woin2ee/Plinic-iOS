//
//  PostAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

final class PostAPI: ObservableObject {
    
    private let postPath: String = "/plinic/posts" // 기본 path
    
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
            networkService.request(path: postPath) { result in
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
    func getPostDetail(id: Int, _ completion: @escaping ((Result<PostDetail, Error>) -> Void)) {
        let requestPath = "/\(postPath)/\(id)"
        
        networkService.request(path: requestPath, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let postDetail = try JSONDecoder.init().decode(PostDetail.self, from: data)
                    completion(.success(postDetail))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  GenreAPI.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/24.
//

import Foundation

final class GenreAPI: ObservableObject {
    
    private let genresPath: String = "/plinic/genres" // 기본 path
    
    private let networkService = NetworkService.init()
    
    
    
    // MARK: - 게시물 목록(GET)
    func getPostList(_ completion: @escaping ((Result<Genres, Error>) -> Void)) {
        
        networkService.request(path: genresPath) { result in
            switch result {
            case .success(let data):
                do {
                    let genres = try JSONDecoder.init().decode(Genres.self, from: data)
                    completion(.success(genres))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

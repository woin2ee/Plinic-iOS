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
    private let jsonDecoder: DefaultJsonDecoder = .init()
    
    
    // MARK: - 장르 목록(GET)
    func getGenres(_ completion: @escaping (Genres?) -> Void) {
        
        networkService.request(path: genresPath, headers: nil) { [self] result in
            switch result {
            case .success(let data):
                guard let genres = jsonDecoder.decode(Genres.self, from: data) else {
                    return completion(nil)
                }
                return completion(genres)
            case .failure(let error):
                return completion(nil)
            }
        }
    }
}

//
//  GenreAPI.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/24.
//

import Foundation

final class GenreAPI: ObservableObject {
    
    private let basePath: String = "/plinic/genres"
    
    private let networkService = NetworkService.init()
    private let jsonDecoder: DefaultJsonDecoder = .init()
    
    /// 고정된 URL 로 API 요청을 보내, 장르 목록을 받아온 다음 completion 을 호출합니다.
    func getGenres(_ completion: @escaping (Genres?) -> Void) {
        networkService.request(path: basePath, headers: nil) { [self] result in
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

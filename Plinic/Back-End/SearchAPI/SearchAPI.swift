//
//  SearchAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/26.
//

import Foundation

final class SearchAPI: ObservableObject {
    
    private let searchURL: String = ""
    private let networkService = NetworkService.init()
    
    /// 검색 결과에 대한 응답을 가져오는 함수
    func getSearchResult(
        by searchWord: String,
        _ completion: @escaping ((Result<SearchResult, Error>) -> Void)
    ) {
        
        completion(.success(.createMock()))
        
        // MARK: API 미구현
//        networkService.request(path: searchURL) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let recentNotice = try JSONDecoder.init().decode(RecentNotice.self, from: data)
//                    completion(.success(recentNotice))
//                } catch let error {
//                    print(error)
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                print(error)
//                completion(.failure(error))
//            }
//        }
    }
}

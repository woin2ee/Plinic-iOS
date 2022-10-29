//
//  NoticeAPI.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

final class NoticeAPI: ObservableObject {
    
    private let basePath: String = "/plinic/notices"
    
    private let networkService = NetworkService.init()
    
    /// API 요청으로 가장 최근 공지사항 한개를 가져온 다음 completion 을 호출합니다.
    func getRecentNotice(_ completion: @escaping ((Result<RecentNotice, Error>) -> Void)) {
        let requestPath: String = "\(basePath)?recent=true"
        
        networkService.request(path: requestPath) { result in
            switch result {
            case .success(let data):
                do {
                    let recentNotice = try JSONDecoder.init().decode(RecentNotice.self, from: data)
                    completion(.success(recentNotice))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}

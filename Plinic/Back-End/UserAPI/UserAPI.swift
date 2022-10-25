//
//  UserAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/23.
//

import Foundation

final class UserAPI: ObservableObject {
    
    private let userPath: String = "/accounts"
    
    private let networkService = NetworkService.init()
    
    // MARK: 아직 계정이 없는듯
    /// 특정 유저 정보를 가져오는 함수
    func getUserInfo(by nickName: String, _ completion: @escaping ((Result<UserInfo, Error>) -> Void)) {
        let detailPath: String = "/profiles/\(nickName)"
        let requestPath: String = "\(userPath)\(detailPath)"
        
        networkService.request(path: requestPath, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let userInfo = try JSONDecoder.init().decode(UserInfo.self, from: data)
                    completion(.success(userInfo))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

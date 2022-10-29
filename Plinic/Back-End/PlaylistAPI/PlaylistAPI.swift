//
//  PlaylistAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/25.
//

import Foundation

final class PlaylistAPI: ObservableObject {
    
    private let playlistPath: String = "/plinic/playlists"
    
    private let networkService = NetworkService.init()
    
    /// 특정 플레이리스트의 ID 값으로 API 요청을 보내, 해당 플레이리스트의 상세 정보를 가져온 후 completion 을 호출합니다.
    func getPlaylistDetail(by id: Int, _ completion: @escaping ((Result<PlaylistDetail, Error>) -> Void)) {
        let requestPath: String = "\(playlistPath)/\(id)"

        networkService.request(path: requestPath, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let playlistDetail = try JSONDecoder.init().decode(PlaylistDetail.self, from: data)
                    completion(.success(playlistDetail))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

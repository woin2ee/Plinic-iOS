//
//  BackgroundVideo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/18.
//

import Foundation

struct BackgroundVideo: Codable {
    
    let backgroundVideo : String
    
    enum CodingKeys: String, CodingKey {
        case backgroundVideo = "background_url"
    }
}

class RequestAPI: ObservableObject {
    
    private let backgroundURL : String = "http://35.79.181.245:8000/api/v1/plinic/random-background/"
    
    func getBackgroundVideo(_ completion: @escaping ((Result<String, Error>) -> Void)) { // @escaping (Result<String, Error>)
        guard let url = URL(string: "\(backgroundURL)") else {
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
                    let decodeData = try decoder.decode(BackgroundVideo.self, from: JSONdata)

                    completion(.success(decodeData.backgroundVideo)) // completion을 함수처럼 사용
                    
                } catch {
                    print(error)
                    completion(.failure(error)) // 컴플리션 에러처리
                }
            }
        }
        task.resume()
    }
}

//
//  NetworkService.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

enum NetworkError: Error {
    case invaildUrl
    case commonError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

final class NetworkService {
    
    private let baseURL = Bundle.main.infoDictionary?["API_REQUEST_BASE_URL"] as! String
    
    /// API 요청을 보내고 싶을때 사용하는 함수
    ///
    /// - Parameters:
    ///     - path: 스웨거 API 문서상에서 확인할 수 있는 요청 path (ex: /plinic/random-background/)
    ///     - method: HTTP method 종류, default 값은 GET 방식
    ///     - completion: 통신 완료 시 호출되는 클로저, 성공했을 시 Data 를, 실패했을 시 Error 를 가지고 호출한다.
    func request(
        path: String,
        method: HttpMethod = .get,
        _ completion: @escaping (Result<Data, Error>) -> Void
    ) {
        request(absolutePath: "\(baseURL)\(path)", method: method, completion)
    }
    
    /// API 요청을 보내고 싶을때 사용하는 함수
    ///
    /// - Parameters:
    ///     - absolutePath: 실제 요청을 보내는 전체 URL
    ///     - method: HTTP method 종류, default 값은 GET 방식
    ///     - completion: 통신 완료 시 호출되는 클로저, 성공했을 시 Data 를, 실패했을 시 Error 를 가지고 호출한다.
    func request(
        absolutePath: String,
        method: HttpMethod = .get,
        _ completion: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let url = URL.init(string: absolutePath) else {
            completion(.failure(NetworkError.invaildUrl))
            return
        }
        
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = .init(5)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode)
            else {
                completion(.failure(NetworkError.commonError))
                return
            }
            
            completion(.success(data))
            
        }.resume()
    }
}

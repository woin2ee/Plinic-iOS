//
//  DefaultJsonDecoder.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/29.
//

import Foundation
import OSLog

struct DefaultJsonDecoder {
    
    private let decoder = JSONDecoder.init()
    
    func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        do {
            let decodedData = try decoder.decode(type.self, from: data)
            Logger.decoder.notice("디코딩 성공: \(T.self)")
            return decodedData
        } catch let error {
            Logger.decoder.error("디코딩 실패: \(error.localizedDescription)")
            return nil
        }
    }
}

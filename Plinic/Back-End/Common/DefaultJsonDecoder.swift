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
            return decodedData
        } catch let error {
            _ = error
            return nil
        }
    }
}

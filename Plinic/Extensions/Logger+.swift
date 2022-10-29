//
//  Logger+.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/29.
//

import Foundation
import OSLog

extension Logger {
    
    static let bundleIdentifier = Bundle.main.bundleIdentifier!
    
    static let network = Logger.init(subsystem: bundleIdentifier, category: "Network")
    static let decoder = Logger.init(subsystem: bundleIdentifier, category: "Decoder")
}

//
//  UIImage+.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/26.
//

import SwiftUI

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    } // UIImage to String
}

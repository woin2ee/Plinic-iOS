//
//  View+.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/23.
//

import SwiftUI

extension View {
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        return modifier(ViewDidLoadModifier.init(perform: action))
    }
}

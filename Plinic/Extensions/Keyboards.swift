//
//  Keyboards.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/18.
//

import SwiftUI

extension View {
    
    /// 다른 부분 탭했을 때 키보드 숨기는 함수
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

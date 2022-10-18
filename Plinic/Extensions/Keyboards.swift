//
//  Keyboards.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/18.
//

import SwiftUI

extension View {
  func HideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
} // 다른 부분 탭했을 때 키보드 숨기는 함수

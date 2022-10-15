//
//  loginContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/14.
//

import Foundation
import SwiftUI

struct LoginContentView : View {
    
    var body: some View{
        VStack{
            Image("플리닉로고")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 300, maxHeight: 200, alignment: .center)
            LoginButton()
//                .background(VideoBackgroundView())
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

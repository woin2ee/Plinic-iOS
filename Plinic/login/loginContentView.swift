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
        ZStack{
            LoginButton()
                .background(VideoBackgroundView())
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

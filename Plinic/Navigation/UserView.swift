//
//  UserView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/15.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView{
            UserContentView(nickName: "안녕")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

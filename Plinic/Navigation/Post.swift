//
//  Post.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/17.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        NavigationView{
            postContentView()
            
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

//
//  userPlaylist.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/01.
//

import SwiftUI

struct UserPlaylist: View {
    
    var playlistURL : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                PlaylistInfo(playlistTitle: "자기전에 듣기 좋은 노래", songs: "20")
                
                PlaylistWebView(playlistURL: "\(playlistURL)")
                    .frame(height: 550)
            } // VStack
        } // ZStack
    }
}

struct UserPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        UserPlaylist(playlistURL: "https://www.youtube.com/watch?v=vadat46yfwg&list=PL7-f8-kndz_d11Enm7ttqXKfqSKzvG60Q&index=1")
    }
}


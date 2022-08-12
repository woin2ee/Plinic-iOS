//
//  userPlaylist.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/01.
//

import SwiftUI

struct UserPlaylist: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                PlaylistInfo(playlistTitle: "자기전에 듣기 좋은 노래", songs: "20")
                
                PlaylistWebView(playlistURL: "https://www.youtube.com/watch?v=kalSK-3PPnc&list=PLgOlaPUIbynqyJHiTEv7CFaXd8g5jtogT&index=4")
                    .frame(height: 550)
            } // VStack
        } // ZStack
    }
}

struct UserPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        UserPlaylist()
    }
}


//
//  userPlaylist.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/01.
//

import SwiftUI

struct UserPlaylist: View {
    
    @StateObject var playlistAPI = PlaylistAPI.init()
    
    @State var playlistDetail: PlaylistDetail = .createEmpty()
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            GeometryReader{ geo in
                VStack{
                    PlaylistInfoView(playlistDetail: $playlistDetail)
                        .frame(height: geo.size.height * 0.25)
                    WebView(requestURL: playlistDetail.totalURL)
                }
            }
        }
        .onAppear() {
            playlistAPI.getPlaylistDetail(by: playlistDetail.id) { result in
                switch result {
                case .success(let playlistDetail):
                    self.playlistDetail = playlistDetail
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct UserPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserPlaylist(playlistDetail: .createMock())
            UserPlaylist(playlistDetail: .createMock())
            .previewDevice("iPhone 8")
        }
    }
}


//
//  UserMyPlaylistView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

enum PlaylistType: String {
    case publicPlaylist = "공개된 플레이리스트"
    case privatePlaylist = "비공개된 플레이리스트"
}

struct UserMyPlaylistView: View {
    
    @Binding var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    HorizontalPlaylistView(
                        userInfo: $userInfo,
                        playlistType: .publicPlaylist,
                        geometry: geo
                    )
                    
                    HorizontalPlaylistView(
                        userInfo: $userInfo,
                        playlistType: .privatePlaylist,
                        geometry: geo
                    )
                }
            }
        }
    }
}

struct HorizontalPlaylistView: View {
    
    @Binding var userInfo: UserInfo
    var playlistType: PlaylistType
    var geometry: GeometryProxy
    var displayedPlaylistInfo: [briefPlaylistInfo] {
        playlistType == .publicPlaylist ? userInfo.publicPlaylists : userInfo.privatePlaylists
    }
    
    var body: some View {
        VStack {
            Text(playlistType.rawValue)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height * 0.04,
                    alignment: .leading
                )
            
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(displayedPlaylistInfo, id: \.uuid) { info in
                        NavigationLink(destination: PlaylistView(id: info.id)) {
                            VStack{
                                ThumbnailView(imageUrl: info.thumbnailUrl ?? "defaultImg")
                                    .padding(.bottom, 5)
                                Text(info.title)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }
                            .frame(maxWidth: 180, maxHeight: 200)
                        }
                    }
                    .padding(.top, 5)
                }
                .padding([.top, .leading, .bottom], 5)
                // HStack
            }
            .padding(.leading, 10.0)
            // ScrollView
        }
    }
}

struct UserMyPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        UserMyPlaylistView(userInfo: .constant(.createMock()))
    }
}

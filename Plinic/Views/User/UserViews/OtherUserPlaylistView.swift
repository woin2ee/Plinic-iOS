//
//  OtherUserPlaylist.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/26.
//

import SwiftUI

enum OtherPlaylistType: String {
    case publicPlaylist = "공개된 플레이리스트"
    case scrabedPlaylist = "스크랩한 플레이리스트"
}

struct OtherUserPlaylistView: View {
    
    @Binding var otherUserInfo: OtherUserInfo
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    HorizontalOtherPlaylistView(
                        otherUserInfo: $otherUserInfo,
                        playlistType: .publicPlaylist,
                        geometry: geo
                    )
                    
                    HorizontalOtherPlaylistView(
                        otherUserInfo: $otherUserInfo,
                        playlistType: .scrabedPlaylist,
                        geometry: geo
                    )
                }
            }
        }
    }
}

struct HorizontalOtherPlaylistView: View {
    
    @Binding var otherUserInfo: OtherUserInfo
    var playlistType: OtherPlaylistType
    var geometry: GeometryProxy
    var displayedPlaylistInfo: [briefPlaylistInfo] {
        playlistType == .publicPlaylist ? otherUserInfo.publicPlaylists : otherUserInfo.scrappedPlaylists
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

struct OtherUserPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserPlaylistView(otherUserInfo: .constant(.createMock()))
    }
}

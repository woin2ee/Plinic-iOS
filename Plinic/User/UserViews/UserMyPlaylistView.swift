//
//  UserMyPlaylistView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct UserMyPlaylistView: View {
    
    var playlistTitle : String
    let openPlaylist = Array(1...12)
    let unOpenPlaylist = Array(1...17)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader{ geo in
                VStack {
                    VStack() {
                        Text("공개된 플레이리스트")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .frame(width: geo.size.width, height: geo.size.height * 0.04, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack() {
                                ForEach(openPlaylist, id: \.self) {i in
                                    NavigationLink(destination: UserPlaylist(playlistURL: "https://www.youtube.com/watch?v=vadat46yfwg&list=PL7-f8-kndz_d11Enm7ttqXKfqSKzvG60Q&index=1")){
                                        VStack{
                                            ThumbnailView(thumbnail: "defaultImg")
                                                .padding(.bottom, 5)
                                            Text("\(playlistTitle)")
                                                .foregroundColor(Color.white)
                                                .fontWeight(.bold)
                                                .font(.system(size: 15))
                                        }//VStack
                                        .frame(maxWidth: 180, maxHeight: 200)
                                    }
                                }
                                .padding(.top, 5)
                            } // ScrollView
                            .padding([.top, .leading, .bottom], 5)
                        }//VStack
                        .padding(.leading, 10.0)
                        
                        VStack() {
                            Text("비공개된 플레이리스트")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .frame(width: geo.size.width, height: geo.size.height * 0.04, alignment: .leading)
                            
                            ScrollView(.horizontal) {
                                HStack() {
                                    ForEach(unOpenPlaylist, id: \.self) {i in
                                        NavigationLink(destination: UserPlaylist(playlistURL: "https://www.youtube.com/watch?v=vadat46yfwg&list=PL7-f8-kndz_d11Enm7ttqXKfqSKzvG60Q&index=1")){
                                            VStack{
                                                ThumbnailView(thumbnail: "defaultImg")
                                                    .padding(.bottom, 5)
                                                Text("\(playlistTitle)")
                                                    .foregroundColor(Color.white)
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 15))
                                            }//VStack
                                            .frame(maxWidth: 180, maxHeight: 200)
                                        } // NavigationLink
                                    } //ForEach
                                    .padding(.top, 5)
                                } // ScrollView
                                .padding([.top, .leading, .bottom], 5)
                            }//VStack
                            .padding(.leading, 10.0)
                            //                    .padding(.top, 20.0)
                        }
                    }
                    
                }// ZStack
            }
        }
    }
}
struct UserMyPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        UserMyPlaylistView(playlistTitle: "플레이리스트 제목")
    }
}

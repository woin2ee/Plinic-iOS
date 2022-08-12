//
//  userMyPlaylist.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct userMyPlaylist: View {
    
    var playlistTitle : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack(spacing:0) {
                    Text("공개된 플레이리스트")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 390, height: 20, alignment: .leading)
                    ScrollView(.horizontal) {
                        HStack(spacing:40) {
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                        }//HSTack
                    }
                    .frame(width: 380, height: 200, alignment: .leading)
                    .padding(.leading, 10.0)
                    .padding(.top, 10.0)
                }//VStack
                .frame(width: 380, height: 235, alignment: .leading)
                .padding(.leading, 10.0)
                .padding(.top, 20.0)
                VStack(spacing:0) {
                    Text("비공개된 플레이리스트")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 390, height: 20, alignment: .leading)
                    ScrollView(.horizontal) {
                        HStack(spacing:40) {
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("\(playlistTitle)")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                        }//HSTack
                    }
                    .frame(width: 380, height: 200, alignment: .leading)
                    .padding(.leading, 10.0)
                    .padding(.top, 10.0)
                }//VStack
                .frame(width: 380, height: 235, alignment: .leading)
                .padding(.leading, 10.0)
                .padding(.top, 25.0)
            }//VStack
        }// ZStack
    }
}
struct userMyPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        userMyPlaylist(playlistTitle: "플레이리스트 제목")
    }
}

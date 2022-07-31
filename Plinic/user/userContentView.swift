//
//  userContentView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct userContentView: View {
    
    var nickName : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing:0) {
                HStack(spacing:0) {
                    Text("\(nickName)")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .tracking(-0.41)
                        .padding(.trailing, 175.0)
                        .padding(.leading, 10.0)
                    //유저 이름
                    Image(systemName: "plus.circle")
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                        .padding(.trailing, 15.0)
                    Image(systemName: "music.note.list")
                        .padding(.trailing, 10.0)
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))

                }
                .frame(width: 390, height: 42, alignment: .center)
                //HStack
                userInfo()
                    .padding(.top, 10.0)
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
                                Text("플레이리스트 제목")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("플레이리스트 제목")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("플레이리스트 제목")
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
                                Text("플레이리스트 제목")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("플레이리스트 제목")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                            }//VStack
                            VStack(spacing:0) {
                                Thumbnail(thumbnail: "defaultImg")
                                Text("플레이리스트 제목")
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
        }//ZStack
    }
}

struct userContentView_Previews: PreviewProvider {
    static var previews: some View {
        userContentView(nickName: "NickName")
    }
}

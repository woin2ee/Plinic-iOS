//
//  userMyPost.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct userMyPost: View {
    
    var postTitle : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack(spacing:0) {
                    Text("작성한 게시글")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 390, height: 20, alignment: .leading)
                        .padding(.leading, 10.0)
                    ScrollView(.vertical) {
                        VStack {
                            HStack(spacing:30) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                            HStack(spacing:30) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                            HStack(spacing:30) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                            HStack(spacing:30) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                            HStack(spacing:30) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(postTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                        }//VStack
                    }
                    .frame(width: 370, height: 460, alignment: .leading)
                    .padding(.top, 10.0)
                }//VStack
                .frame(width: 370, height: 460, alignment: .center)
                .padding(.top, 20.0)
            }//VStack
        }//ZStack
    }
}

struct userMyPost_Previews: PreviewProvider {
    static var previews: some View {
        userMyPost(postTitle: "게시글 제목")
    }
}

//
//  postDetail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetail: View {
    
    @StateObject var postDetailData: PostDetailData = PostDetailData()
    @State var postDetil : PostDetailAPI = PostDetailAPI.creatEmpty()
    @State var totalURL: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader{ geo in
                
            }
            VStack{
                ScrollView{
                    PostDetailInfo(profilePic: "random1", nickname: postDetil.author, content: postDetil.content, title: postDetil.title, createdAt: postDetil.createdAt, updatedAt: postDetil.updatedAt, tagSet: postDetil.tagSet, genreName: postDetil.plInfo.genreName)
                        .onAppear(){
                            postDetailData.getPostDetail(postID: postDetil.id){ result in
                                switch result {
                                case .success(let success):
                                    self.postDetil = success
                                    print(postDetil)
                                case .failure(let failure):
                                    _ = failure
                                }
                            }
                        }
                    Spacer()
                } // ScrollView
                .frame(maxHeight: 200)
                
                PlaylistWebView(playlistURL: "\(postDetil.plInfo.totalURL)")
                    .frame(minHeight: 400)
                
            } // VStack
        } // ZStack
    }
}


struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetail(totalURL: "http://www.youtube.com/watch_videos?video_ids=K2MfpA_4EEs,2vSFVr5Unig,Vc5JNvIq22Q")
        }
    }
}

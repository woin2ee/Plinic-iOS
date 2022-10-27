//
//  PostDetailView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetailView: View {
    
    @StateObject var postAPI: PostAPI = PostAPI()
    @StateObject var playlistAPI: PlaylistAPI = .init()
    
    @State var postDetail : PostDetail = PostDetail.creatEmpty()
    @State var postId: Int
    var profileImageUrl: String?
    
    @State var youtubeUrl: PlaylistUrl = .createEmpty()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    PostDetailInfoView(
                        postDetail: $postDetail,
                        profilePic: profileImageUrl
                    )
                    Spacer()
                } // ScrollView
                .frame(maxHeight: 200)
                
                WebView(requestURL: $youtubeUrl.totalUrl)
                    .frame(minHeight: 400)
            } // VStack
            .onAppear(){
                postAPI.getPostDetail(id: postId) { result in
                    switch result {
                    case .success(let postDetail):
                        self.postDetail = postDetail
                        print("PostDetailView의 onAppear", postDetail)
                    case .failure(let failure):
                        _ = failure
                        print("Failure")
                    }
                }
                playlistAPI.getPlayListUrl(byYoutubeId: YoutubeIdStorage.randomIds) { result in
                    switch result {
                    case .success(let url):
                        self.youtubeUrl = url
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } // ZStack
    }
}


struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetailView(
                postDetail: .createMock(),
                postId: 1,
                profileImageUrl: "random1"
            )
        }
    }
}

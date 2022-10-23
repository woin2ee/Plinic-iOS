//
//  postContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/17.
//

import SwiftUI

struct postContentView: View {
    
    // MARK: - 통신으로 받아오는 데이터
    @StateObject var postAPI: PostAPI = PostAPI()

    @State var postData : PostList = PostList.create()
    @State var postList: [Post] = [Post.creatEmpty()]
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                
                PostHeader()
                
                ScrollView{
                    LazyVStack{
                        ForEach(postList, id: \.self) { post in
                            PostView(profilePic: post.author.profilePic ?? "profileDefault", nickname: post.author.nickname, thumbnailImgURL: post.plInfo.thumbnailImgURL ?? "defaultImg", content: post.content, title: post.title, postID: post.postID)
                                .onAppear() {
                                    if let last = self.postList.last,
                                       last == post,
                                       post.postID >= 0,
                                       postList.count < postData.count
                                    {
                                        postAPI.getPostList(nextURL: postData.next) { result in
                                            switch result {
                                            case .success(let success):
                                                self.postData = success
                                                self.postList.append(contentsOf: success.results)
                                            case .failure(let failure):
                                                _ = failure
                                            }
                                        }
                                    }
                                }
                        }
                    } //ForEach
                }
                .onLoad() {
                    postAPI.getPostList(nextURL: self.postData.next) { result in
                        switch result {
                        case .success(let success):
                            self.postList = success.results
                            self.postData = success
                        case .failure(let failure):
                            _ = failure
                        }
                        
                    }
                }
            }
            
        } // VStack
    } // ZStack
}


struct postContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            postContentView()
            postContentView()
                .previewDevice("iPhone 8")
        }
    }
}

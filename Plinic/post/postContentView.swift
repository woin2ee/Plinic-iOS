//
//  postContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/17.
//

import SwiftUI

struct postContentView: View {
    
    @StateObject var postListAPI: PostListAPI = PostListAPI()
    
    // MARK: - 통신으로 받아오는 데이터
    @State var postData : PostList = PostList.create()
    @State var postList: [Post] = [Post.creatEmpty()]
    
    //    let data = Array(1...17)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                
                PostHeader(topNotice : "공지 제목입니다")
                
                
                ScrollView{
                    LazyVStack{
                        ForEach(postList, id: \.self) { post in
                            // MARK: - Refactor
                            postInfo(profilePic: post.author.profilePic ?? "profileDefault", nickname: post.author.nickname, thumbnailImgURL: post.plInfo.thumbnailImgURL ?? "defaultImg", content: post.content, title: post.title)
                                .onAppear(){
                                    if let last = self.postList.last, last == post, post.id >= 0{
                                        postListAPI.getPostList(nextURL: postData.next){ result in
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
                .onAppear(){
                    postListAPI.getPostList(nextURL: self.postData.next){ result in
                        switch result {
                        case .success(let success):
                            self.postList = success.results
                            self.postData = success
                        case .failure(let failure):
                            _ = failure
                        }
                        
                    }
                } // onAppear
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

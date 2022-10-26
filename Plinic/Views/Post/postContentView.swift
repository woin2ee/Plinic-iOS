//
//  PostContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/17.
//

import SwiftUI

struct PostContentView: View {
    
    // MARK: - 통신으로 받아오는 데이터
    @StateObject var postAPI: PostAPI = PostAPI()

    @State var postData : PostList = PostList.create()
    @State var postList: [Post] = [Post.createEmpty()]
    
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                
                PostHeaderView()
                
                RefreshableScrollView(onRefresh: { done in
                    updatePostList()
                    done()
                }) {
                    LazyVStack{
                        ForEach(postList, id: \.uuid) { post in
                            PostView(postInfo: post)
                                .onAppear() {
                                    if let last = self.postList.last,
                                       last.id == post.id,
                                       post.id >= 0,
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
                    }
                    .onLoad() {
                        updatePostList()
                    }
                }
            }
        } // VStack
    } // ZStack
    
    private func updatePostList() {
        postAPI.getPostList() { result in
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

struct PostContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostContentView(
                postData: .createMock(),
                postList: [
                    .createMock(),
                    .createMock(),
                    .createMock(),
                    .createMock(),
                    .createMock()
                ]
            )
            PostContentView(
                postData: .createMock(),
                postList: [
                    .createMock(),
                    .createMock(),
                    .createMock(),
                    .createMock(),
                    .createMock()
                ]
            )
                .previewDevice("iPhone 8")
        }
    }
}

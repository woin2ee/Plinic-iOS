//
//  OtherUserPostView.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import SwiftUI

struct OtherUserPostView: View {
    
    @Binding var otherUserInfo: OtherUserInfo
        
        var columns = [GridItem(.fixed(180)), GridItem(.fixed(180))]
        
        var body: some View {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("작성한 게시글")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 390, height: 20, alignment: .leading)
                        .padding(.leading, 10.0)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(otherUserInfo.writtenPosts, id: \.uuid) { postInfo in
                                // VStack으로 도형추가
                                NavigationLink(destination: PostDetailView(
                                    postId: postInfo.id,
                                    profileImageUrl: otherUserInfo.profileImageUrl
                                )) {
                                    VStack {
                                        ThumbnailView(imageUrl: postInfo.thumbnailUrl)
                                        Text("\(postInfo.title)")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                    }
                                    .padding(.horizontal, 5)
                                }
                            }
                            // ForEach
                        }
                        // LazyVGrid
                    }
                    // ScrollView
                }
                // VStack
            }
            // ZStack
        }
}

struct OtherUserPostView_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserPostView(otherUserInfo: .constant(.createMock()))
    }
}

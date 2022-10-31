//
//  UserPostView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct UserPostView: View {
    
    @Binding var userInfo: UserInfo
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("작성한 게시글")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(userInfo.writtenPosts, id: \.uuid) { postInfo in
                            NavigationLink(destination: PostDetailView(
                                postId: postInfo.id,
                                profileImageUrl: userInfo.profileImageUrl
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
                        } // ForEach
                    } // LazyVGrid
                } // ScrollView
            } // VStack
        } // ZStack
    }
}

struct UserPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostView(userInfo: .constant(.createMock()))
        UserPostView(userInfo: .constant(.createMock()))
            .previewDevice("iPhone 13 Pro Max")
        UserPostView(userInfo: .constant(.createMock()))
            .previewDevice("iPhone 8")
    }
}

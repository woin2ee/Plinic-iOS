//
//  UserMyPostView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct UserMyPostView: View {
    
    @Binding var userInfo: UserInfo
    
    // FIXME: 화면 크기가 다른 기종에서는 고정크기가 문제 생길 수 있음.
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
                        ForEach(userInfo.writtenPosts, id: \.uuid) { postInfo in
                            // VStack으로 도형추가
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



struct UserMyPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserMyPostView(userInfo: .constant(.createMock()))
        UserMyPostView(userInfo: .constant(.createMock()))
            .previewDevice("iPhone 8")
    }
}

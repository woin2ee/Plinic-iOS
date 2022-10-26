//
//  PostInfoView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/13.
//

import SwiftUI

struct PostView: View {
    
    @State var postInfo: Post
    @State private var scrap = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.5)
                    .padding(.bottom, 5)
                // 게시글 간의 구분 선
                
                // 상단의 게시글 작성자 정보
                    .padding(.bottom, 5)
                HStack{
                    Image(postInfo.author.profilePic ?? "profileDefault")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 3.5))
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                        .clipShape(Circle())
                    
                    VStack{
                        Text("\(postInfo.author.nickname)")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .frame(minWidth: 100, maxWidth: 300, minHeight: 10, maxHeight: 30, alignment: .leading)
                        // 유저 닉네임
                    }
                    Spacer()
                }
                NavigationLink(destination: PostDetailView(
                    postId: postInfo.id,
                    profileImageUrl: postInfo.author.profilePic
                )) {
                    Image(postInfo.plInfo.thumbnailImgURL ?? "profileDefault")
                        .resizable()
                        .frame(maxWidth: 390, maxHeight: 390)
                    // 게시글 썸네일
                }
                
                HStack{
                    
                    Button(action: {
                        postInfo.isLike.toggle()
                        if postInfo.isLike == true {
                            postInfo.likerCount += 1
                        } else {
                            postInfo.likerCount -= 1
                        }
                        
                        // 클릭 했을 때 좋아요 기능 구현
                    }, label: {
                        
                        Image(systemName: postInfo.isLike ? "heart.fill" : "heart")
                            .font(.system(size: 31))
                        //                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(width: 44, height: 44)
                            .padding(.leading, 5)
                    })
                    //                    .padding(.leading, 5)
                    // 좋아요 버튼
                    
                    Text("좋아요 \(postInfo.likerCount)개")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: 150, maxHeight: 44, alignment: .leading)
                    //                        .padding(.leading, 5)
                    // 좋아요 개수 표시
                    
                    
                    Spacer()
                    Button(action: {
                        // 클릭 했을 때 공유기능 구현
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 31))
                        //                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(width: 44, height: 44)
                    })
                    // 공유 버튼
                    
                    Button(action: {
                        self.scrap.toggle()
                        // 내 보관함에 저장기능 구현
                    }, label: {
                        Image(systemName: scrap ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 31))
                            .foregroundColor(Color.white)
                            .frame(width: 44, height: 44)
                            .padding(.trailing, 5)
                    })
                    // 스크랩 버튼
                } // 게시글 하단의 버튼
                
                Text("\(postInfo.title)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 390, maxHeight: 44, alignment: .leading)
                    .padding(.leading, 5)
                // 게시글 제목
                HStack{
                    
                    Text("\(postInfo.content)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 300, maxHeight: 42, alignment: .leading)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .padding(.leading, 5)
                        .padding(.trailing, 20)
                    // 게시글 내용
                    
                    NavigationLink(destination: PostDetailView(
                        postId: postInfo.id,
                        profileImageUrl: postInfo.author.profilePic
                    )) {
                        Text("더보기")
                            .padding(.trailing, 5)
                    } // 게시글 더보기
                }
            }
        } // 검은 배경
    }
}


struct PostInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostView(
                postInfo: .createMock()
            )
        }
    }
}

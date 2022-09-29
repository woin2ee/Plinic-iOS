//
//  postDetailInfo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetailInfo: View {
    
    static let dateFormat : DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.dateFormat = "YYYY.MM.DD"
        formatter.dateStyle = .long
        return formatter
    }()
    var today = Date()
    
    var profileImg : String // 유저의 프로필 사진
    var userName  : String // 유저의 닉네임
    var postContext : String // 게시글 내용
    var postName : String //  게시글 제목
    var heartCnt : String // 좋아요 개수
    
    
    @State private var heart = false // 좋아요 클릭 했는 지 안했는 지
    @State private var scrap = false // 스크랩을 했는 지 안했는 지
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(profileImg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Circle()
                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 5))
                        .frame(maxWidth: 44, maxHeight: 44)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                    // 유저 프로필 사진
                    
                    Text("\(userName)")
                        .font(.system(size: 17))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 200, maxHeight: 42, alignment: .leading)
                        .padding(.leading, 5)
                    // 유저 닉네임
                    Button(action: {
                        self.heart.toggle()
                        // 클릭 했을 때 좋아요 기능 구현
                    }, label: {
                        
                        Image(systemName: heart ? "heart.fill" : "heart")
                            .font(.system(size: 31))
                        //                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    //                    .padding(.leading, 5)
                    // 좋아요 버튼
                    
                    Button(action: {
                        // 클릭 했을 때 공유기능 구현
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 31))
                        //                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    // 공유 버튼
                    
                    Button(action: {
                        self.scrap.toggle()
                        // 내 보관함에 저장기능 구현
                    }, label: {
                        Image(systemName: scrap ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 31))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    // 스크랩 버튼
                    
                    
                    
                } // 상단의 게시글 작성자 정보
                .padding(.bottom, 5)
                
                HStack{
                    
                    Text("좋아요 \(heartCnt)개")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: 200, maxHeight: 44, alignment: .leading)
                    // 좋아요 개수 표시
                    
                    Spacer()
                    
                    Text("\(today, formatter : postInfo.dateFormat)")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 200, maxHeight: 44, alignment: .trailing)
                        .padding(.trailing, 5)
                    // 날짜
                    
                } // 게시글 하단의 버튼
                
                Text("\(postName)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 500, maxHeight: 44, alignment: .leading)
                // 게시글 제목
                HStack{
                    
                    Text("\(postContext)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 500,minHeight: 140, maxHeight: 150, alignment: .top)
                    // 게시글 내용
                    
                }
            } // VStack
        } // ZStack
    }
}

struct PostDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailInfo(profileImg: "random1", userName : "userName", postContext : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. cursus dolor et tortor malesuada, nec vehicula dolor hendrerit. Vivamus interdum nisl ut dolor placerat, viverra porttitor metus commodo. Cras molestie dui nec lacinia luctus. Suspendisse potenti. Quisque sit amet dui vitae ipsum vestibulums. ", postName: "게시글 제목", heartCnt : "200000")
    }
}

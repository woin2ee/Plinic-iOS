//
//  postThumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/13.
//

import SwiftUI

struct PostThumbnail: View {
    
    static let dateFormat : DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY.M.D"
        formatter.dateStyle = .long
        return formatter
    }()
    var today = Date()
    
    var profileImg : String // 유저의 프로필 사진
    var userName  : String // 유저의 닉네임
    var thumbnail : String // 게시글 썸네일 이미지
    var postContext : String // 게시글 내용
    var postName : String
    
    @State private var heart = true
    
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
                        .frame(width: 42, height: 42)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                    // 유저 프로필 사진
                    
                    Text("\(userName)")
                        .font(.system(size: 17))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 42, alignment: .leading)
                        .padding(.leading, 5)
                    // 유저 닉네임
                    
                    Text("\(today, formatter : PostThumbnail.dateFormat)")
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    // 날짜
                        
                    
                } // 상단의 게시글 작성자 정보
                .padding(.bottom, 5)
                
                Image("\(thumbnail)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.green)
                    .frame(width: 390, height: 390)
                // 게시글 썸네일
                
                HStack{
                    
                    Button(action: {
                        self.heart.toggle()
                        // 클릭 했을 때 좋아요 기능 구현
                    }, label: {
                        Image(systemName: "heart")
                            .font(.system(size: 31))
                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(width: 42, height: 42)
                    })
                    .padding(.leading, 5)
                    // 좋아요 버튼
                    
                    
                    Button(action: {
                        // 클릭 했을 때 공유기능 구현
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 31))
                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(width: 42, height: 42)
                    })
                    // 공유 버튼
                    
                    Spacer()
                    
                    Button(action: {
                        // 내 보관함에 저장기능 구현
                    }, label: {
                        Image(systemName: "star")
                            .font(.system(size: 31))
                            .padding(.trailing,10)
                            .foregroundColor(Color.white)
                            .frame(width: 42, height: 42)
                    })
                    .padding(.trailing, 5)
                    // 스크랩 버튼
                } // 게시글 하단의 버튼
                
                Text("\(postName)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy))
                    .multilineTextAlignment(.leading)
                    .frame(width: 390, height: 42, alignment: .leading)
                // 게시글 제목
                HStack{
                    
                    Text("\(postContext)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .frame(width: 300, height: 42, alignment: .leading)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.trailing, 30)
                    // 게시글 내용
                    
                    Button(action: {
                        // 자세히 보기 기능 구현
                    }, label: {
                        Text("더보기")
                    })
                    // 게시글 더보기 버튼
                }
                    
                
            }
        } // 검은 배경
    }
}

struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(profileImg: "random1", userName : "userName", thumbnail: "defaultImg", postContext : "ddddsdasdasd asdasasdasd asdasdasd asdasdasdfghjagsdfjkhg asfasdfjlhgasdjkhf  asdfjkhg", postName: "게시글 제목")
    }
}

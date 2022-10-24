//
//  UserInfoView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct UserInfoView: View {
    
    var profileImg : String // 유저의 프로필 사진
    
    @Binding var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                HStack(spacing: 0) {
                    
                    // FIXME: - AsyncImage 로 바꾸니까 프로필 사진에 초록색 테두리가 안보인당...
                    AsyncImage(url: URL(string: userInfo.profileImageUrl))
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 5))
                        .frame(width: 100, height: 100)
                        .background(Color.green)
                        .clipShape(Circle())
                    //유저 이미지
                    
                    VStack(spacing:5) {
                        
                        HStack(spacing:10){
                            userContents(
                                infoTitle: "플레이리스트",
                                infoCount: userInfo.publicPlaylists.count + userInfo.privatePlaylists.count
                            )
                            userContents(
                                infoTitle: "게시글",
                                infoCount: userInfo.writtenPosts.count
                            )
                            userContents(
                                infoTitle: "스크랩",
                                infoCount: 999
                            )
                        }
                        
                        HStack(spacing:15){
                            GenreTagView(genreName: "장르1")
                            GenreTagView(genreName: "장르2")
                            GenreTagView(genreName: "장르333")
                        }
                        
                    } // VStack
                    
                } // HStack
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.MainColor)
                        .frame(width: 330, height: 40)
                        .cornerRadius(5)
                    
                    NavigationLink(destination:
                                    UserProfileEditView(
                                        userInfo: $userInfo,
                                        userName: userInfo.nickName,
                                        genre1: "Aucoustic",
                                        genre2: "Sad",
                                        genre3: "Happy"
                                    )
                    ) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.BackgroundSubColor)
                                .frame(width: 330, height: 40)
                                .cornerRadius(5)
                            Text("프로필 편집")
                                .fontWeight(.bold)
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                        }
                    }
                } //프로필 편집 버튼
            } // VStack
        } // ZStack
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserInfoView(profileImg: "random1", userInfo: .constant(.createMock()))
            UserInfoView(profileImg: "random1", userInfo: .constant(.createMock()))
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        }
    }
}

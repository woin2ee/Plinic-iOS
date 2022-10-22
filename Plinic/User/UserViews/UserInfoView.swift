//
//  UserInfoView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct UserInfoView: View {
    
    var profileImg : String // 유저의 프로필 사진
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing:10) {
                HStack(spacing:0) {
                    Image(profileImg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 5))
                        .frame(width: 100, height: 100)
                        .background(Color.green)
                        .clipShape(Circle())
                    
                    //유저 이미지
                    VStack(spacing:5) {
                        HStack(spacing:10){
                            userContents(infoTitle:"플레이리스트",infoCount:"000")
                            userContents(infoTitle:"게시글",infoCount:"000")
                            userContents(infoTitle:"스크랩",infoCount:"000")
                        }
                        //                        .frame(width: 260, height: 50, alignment: .center)
                        //HStack
                        HStack(spacing:15){
<<<<<<< HEAD:Plinic/user/userViews/UserInfo.swift
                            genreInfo(genreName: "Acoustic")
                            genreInfo(genreName: "Acoustic")
                            genreInfo(genreName: "Acoustic")
=======
                            GenreTagView(genreName: "Acoustic")
                            GenreTagView(genreName: "Acoustic")
                            GenreTagView(genreName: "Acoustic")
>>>>>>> develop:Plinic/User/UserViews/UserInfoView.swift
                        }
                        //                        .frame(width: 225, height: 30, alignment: .center)
                        //HStack
                    } //VStack
                } //HStack
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.MainColor)
                        .frame(width: 330, height: 40)
                        .cornerRadius(5)
                    
                    NavigationLink(destination: UserProfile(profileImg: "random1", userName: "유재우", genre1: "Aucoustic", genre2: "Sad", genre3: "Happy")){
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
                }
                
                //프로필 편집
            } //VStack
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserInfoView(profileImg: "random1")
            UserInfoView(profileImg: "random1")
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        }
    }
}

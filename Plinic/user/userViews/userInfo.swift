//
//  userInfo.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct userInfo: View {
    
    var nickName : String
    
    var body: some View {
            VStack(spacing:10) {
                HStack(spacing:0) {
                    Text("\(nickName)")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .tracking(-0.41)
                        .padding(.trailing, 175.0)
                        .padding(.leading, 10.0)
                    //유저 이름
                    Image(systemName: "plus.circle")
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                        .padding(.trailing, 15.0)
                    Image(systemName: "music.note.list")
                        .padding(.trailing, 10.0)
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))

                }
                .frame(width: 390, height: 42, alignment: .center)

                HStack(spacing:0) {
                    Circle()
                    .frame(width: 100, height: 100)
                    .padding(.horizontal, 10.0)
                    .foregroundColor(Color.black)
                    //유저 이미지
                    VStack(spacing:5) {
                        HStack(spacing:10){
                            userContents(infoTitle:"플레이리스트",infoCount:"000")
                            userContents(infoTitle:"게시글",infoCount:"000")
                            userContents(infoTitle:"스크랩",infoCount:"000")
                        }
                        .frame(width: 260, height: 50, alignment: .center)
                        HStack(spacing:15){
                            genreInfo(userGenre: "Acoustic")
                            genreInfo(userGenre: "Acoustic")
                            genreInfo(userGenre: "Acoustic")
                        }
                        .frame(width: 225, height: 30, alignment: .center)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(#colorLiteral(red: 0.11249999701976776, green: 0.11249999701976776, blue: 0.11249999701976776, alpha: 1)))
                    .frame(width: 330, height: 30)
                    .cornerRadius(5)

                    Text("프로필 편집")
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                        .tracking(-0.41)
                        .multilineTextAlignment(.center)
                } //프로필 편집
                
            }
        }
}

struct userInfo_Previews: PreviewProvider {
    static var previews: some View {
        userInfo(nickName: "NickName")
    }
}

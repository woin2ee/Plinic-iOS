//
//  userInfo.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct userInfo: View {
    
    
    
    var body: some View {
        VStack(spacing:10) {
            HStack(spacing:0) {
                Circle()
                .frame(width: 100, height: 100)
                .padding(.trailing, 10.0)
                .foregroundColor(Color.white)
                //유저 이미지
                VStack(spacing:5) {
                    HStack(spacing:10){
                        userContents(infoTitle:"플레이리스트",infoCount:"000")
                        userContents(infoTitle:"게시글",infoCount:"000")
                        userContents(infoTitle:"스크랩",infoCount:"000")
                    }
                    .frame(width: 260, height: 50, alignment: .center)
                    //HStack
                    HStack(spacing:15){
                        genreInfo(userGenre: "Acoustic")
                        genreInfo(userGenre: "Acoustic")
                        genreInfo(userGenre: "Acoustic")
                    }
                    .frame(width: 225, height: 30, alignment: .center)
                    //HStack
                } //VStack
            } //HStack
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
            } //ZStack
            //프로필 편집
            
        } //VStack
    }
}

struct userInfo_Previews: PreviewProvider {
    static var previews: some View {
        userInfo()
    }
}

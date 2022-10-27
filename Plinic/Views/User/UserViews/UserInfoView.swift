//
//  UserInfoView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct UserInfoView: View {
    
    @Binding var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    AsyncImage(url: URL(string: userInfo.profileImageUrl)){ image in
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .overlay(Circle()
                                .stroke(Color.MainColor, lineWidth: 5))
                            .clipShape(Circle())
                    } placeholder: {
                        Image("플리닉로고")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .overlay(Circle()
                                .stroke(Color.MainColor, lineWidth: 5))
                            .clipShape(Circle())
                    }
                    
                    //유저 이미지
                    
                    VStack{
                        
                        HStack(spacing:10){
                            UserCountsView(
                                infoTitle: "플레이리스트",
                                infoCount: userInfo.publicPlaylists.count + userInfo.privatePlaylists.count
                            )
                            UserCountsView(
                                infoTitle: "게시글",
                                infoCount: userInfo.writtenPosts.count
                            )
                            UserCountsView(
                                infoTitle: "스크랩",
                                infoCount: userInfo.scrappedPlaylists.count
                            )
                        }
                        .padding([.leading, .trailing], 5)
                        
                        HStack(spacing:15){
                            GenreTagView(genreName: "장르1")
                            GenreTagView(genreName: "장르2")
                            GenreTagView(genreName: "장르333")
                        }
                        
                    } // VStack
                    
                } // HStack
            }
        } // VStack
    } // ZStack
    
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserInfoView(userInfo: .constant(.createMock()))
            UserInfoView(userInfo: .constant(.createMock()))
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        }
    }
}

//
//  OtherUserInfoView.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import SwiftUI

struct OtherUserInfoView: View {
    
    @Binding var otherUserInfo: OtherUserInfo
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    AsyncImage(url: URL(string: "https://plinic-api-server.ml\(otherUserInfo.profileImageUrl ?? "")")){ image in
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
                                infoCount: otherUserInfo.publicPlaylists.count)
                            UserCountsView(
                                infoTitle: "게시글",
                                infoCount: otherUserInfo.writtenPosts.count
                            )
                            UserCountsView(
                                infoTitle: "스크랩",
                                infoCount: otherUserInfo.scrappedPlaylists.count
                            )
                        }
                        .padding([.leading, .trailing], 5)
                        
                        HStack(spacing:15){
                            ForEach(otherUserInfo.favoriteGenres, id: \.self) { genreName in
                                GenreTagView(genreName: genreName)
                            }
                        }
                        
                    } // VStack
                    
                } // HStack
            }
        } // VStack
    } // ZStack
    
}

struct OtherUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OtherUserInfoView(otherUserInfo: .constant(.createMock()))
            OtherUserInfoView(otherUserInfo: .constant(.createMock()))
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        }
    }
}

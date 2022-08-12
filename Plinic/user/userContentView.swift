//
//  userContentView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct userContentView: View {
    
    @State private var postTransform = true
    var nickName : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing:0) {
                HStack(spacing:0) {
                    Text("\(nickName)")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .tracking(-0.41)
                        .frame(width: 270, height: 42, alignment: .leading)
                    //유저 이름
                    Image(systemName: "plus.circle")
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                        .padding(.trailing, 15.0)
                    Button(action: {
                        self.postTransform.toggle()
                    }, label: {
                        Image(systemName: "music.note.list")
                            .padding(.trailing, 10.0)
                            .font(.system(size: 35))
                            .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                        
                    })
                    
                   

                }
                .padding(.leading, 10.0)
                //HStack
                userInfo()
                    .padding(.top, 10.0)
                if(self.postTransform) {
                    userMyPlaylist(playlistTitle: "플레이리스트 제목")
                } else {
                    userMyPost(postTitle: "게시글 제목")
                }
                
            }//VStack
        }//ZStack
    }
}

struct userContentView_Previews: PreviewProvider {
    static var previews: some View {
        userContentView(nickName: "살려줘요")
    }
}


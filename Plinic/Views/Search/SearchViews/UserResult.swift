//
//  UserResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/12.
//

import SwiftUI


struct UserResult: View {
    
    var profileImg : String
    var nickName : String
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: "https://plinic-api-server.ml\(profileImg)")){ image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .frame(maxWidth: 150, maxHeight: 150, alignment: .leading)
                    .overlay(Circle()
                        .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
            } placeholder: { // imageUrl값이 없을 때
                Image("플리닉로고")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .frame(maxWidth: 150, maxHeight: 150, alignment: .leading)
                    .overlay(Circle()
                        .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
            } // 이미지를 동그란형태로 클립하여 백엔드에서 이미지 정보를 주었을 때 profileImg 변수로 동작할수 있게끔 수정 바람
            
            Text("\(nickName)")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
        }//VStack
        .padding(.trailing, 10)
        
    }
    
    struct userResult_Previews: PreviewProvider {
        static var previews: some View {
            UserResult(profileImg:"random1", nickName: "watashi")
        }
    }
}

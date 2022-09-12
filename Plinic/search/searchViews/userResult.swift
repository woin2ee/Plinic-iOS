//
//  userResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/12.
//

import SwiftUI


struct userResult: View {
    
    var profileImg : String
    var nickName : String
    
    var body: some View {
        
        VStack{
            Image(profileImg)
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .clipShape(Circle())
             // 이미지를 동그란형태로 클립하여 백엔드에서 이미지 정보를 주었을 때 profileImg 변수로 동작할수 있게끔 수정 바람
                 .frame(width: 100, height: 100, alignment: .center)
             Text("\(nickName)")
                 .foregroundColor(Color.white)
                 .fontWeight(.bold)
                 .font(.system(size: 15))
        }//VStack

    }
    
    struct userResult_Previews: PreviewProvider {
        static var previews: some View {
            userResult(profileImg:"random1", nickName: "watashi")
        }
    }
}

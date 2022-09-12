//
//  userTopResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/12.
//

import SwiftUI


struct userTopResult: View {
    var body: some View {
        
        HStack{
            userResult(profileImg:"random1", nickName: "watashi").scaleEffect(1.2)
            userContents(infoTitle: "플레이리스트", infoCount: "000")
        }//HStack

    }
    
    struct userTopResult_Previews: PreviewProvider {
        static var previews: some View {
            userTopResult()
        }
    }
}

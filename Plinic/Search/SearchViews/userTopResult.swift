//
//  userTopResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/12.
//

import SwiftUI


struct userTopResult: View {
    
    var profileImg : String
    var nickName : String
    var infoCount : String
    
    var body: some View {
        
        HStack{
            userResult(profileImg:"\(profileImg)", nickName: "\(nickName)").scaleEffect(1.2)
            userContents(infoTitle: "플레이리스트", infoCount: "\(infoCount)")
                .padding(.leading, 10)
        }//HStack

    }
    
    struct userTopResult_Previews: PreviewProvider {
        static var previews: some View {
            userTopResult(profileImg:"random1", nickName: "watashi", infoCount: "012")
        }
    }
}

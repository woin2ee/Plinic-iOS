//
//  userContents.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI


struct userContents: View {
    
    var infoTitle: String
    var infoCount: Int
    
    var body: some View {
        
        VStack{
            //플레이리스트 000
            Text("\(infoTitle)\n\(infoCount)")
                .fontWeight(.bold)
                .font(.system(size: 12))
                .foregroundColor(Color.white)
                .tracking(-0.41)
                .multilineTextAlignment(.center)
                .frame(width: 80, height: 50, alignment: .center)
        }

    }
    
    struct userContents_Previews: PreviewProvider {
        static var previews: some View {
            userContents(infoTitle:"플레이리스트", infoCount: 1)
        }
    }
}

//
//  genreInfo.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct genreInfo: View {
    
    var genreName : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.BackgroundSubColor)
                .frame(width: 65, height: 30)
            Text(genreName)
                .fontWeight(.bold)
                .font(.system(size: 9))
                .foregroundColor(Color.MainColor)
                .multilineTextAlignment(.center)
        }
    }
    struct genreInfo_Previews: PreviewProvider {
        static var previews: some View {
            genreInfo(genreName: "Acoustic")
        }
    }
}


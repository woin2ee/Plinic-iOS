//
//  genreInfo.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct genreInfo: View {
    
    var userGenre : String
    
    var body: some View {
        ZStack {
        //장르
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 0.11249999701976776, green: 0.11249999701976776, blue: 0.11249999701976776, alpha: 1)))
            .frame(width: 65, height: 30)
        //Acoustic
            Text(userGenre)
                .fontWeight(.bold)
                .font(.system(size: 9))
                .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                .multilineTextAlignment(.center)

        }
    }
    struct genreInfo_Previews: PreviewProvider {
        static var previews: some View {
            genreInfo(userGenre: "Acoustic")
        }
    }
}


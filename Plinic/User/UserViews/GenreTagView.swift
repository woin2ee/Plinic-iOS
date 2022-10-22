//
//  GenreTagView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct GenreTagView: View {
    
    var genreName: String
    
    var body: some View {
        ZStack {
            //장르
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.BackgroundSubColor)
            .frame(width: 65, height: 30)
        //Acoustic
            Text(genreName)
                .fontWeight(.bold)
                .font(.system(size: 9))
                .foregroundColor(Color.MainColor)
                .multilineTextAlignment(.center)

        }
    }
    struct GenreTagView_Previews: PreviewProvider {
        static var previews: some View {
            GenreTagView(genreName: "Acoustic")
        }
    }
}


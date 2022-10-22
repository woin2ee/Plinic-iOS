//
//  GenreTagView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct GenreTagView: View {
    
<<<<<<< HEAD:Plinic/user/userViews/genreInfo.swift
    var genreName : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.BackgroundSubColor)
                .frame(width: 65, height: 30)
=======
    var genreName: String
    
    var body: some View {
        ZStack {
            //장르
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.BackgroundSubColor)
            .frame(width: 65, height: 30)
        //Acoustic
>>>>>>> develop:Plinic/User/UserViews/GenreTagView.swift
            Text(genreName)
                .fontWeight(.bold)
                .font(.system(size: 9))
                .foregroundColor(Color.MainColor)
                .multilineTextAlignment(.center)
        }
    }
    struct GenreTagView_Previews: PreviewProvider {
        static var previews: some View {
<<<<<<< HEAD:Plinic/user/userViews/genreInfo.swift
            genreInfo(genreName: "Acoustic")
=======
            GenreTagView(genreName: "Acoustic")
>>>>>>> develop:Plinic/User/UserViews/GenreTagView.swift
        }
    }
}


//
//  genreThumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/29.
//

import SwiftUI

struct GenreThumbnail: View {
    
    var genreImg : String // 썸네일 이미지에 대한 변수
    var genreName : String
    //    var title : String // 썸네일 타이틀에 대한 변수
    let genreColor: [Color] = [Color.MainColor, Color.blue, Color.red, Color.brown, Color.orange, Color.purple, Color.pink, Color.yellow]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
            AsyncImage(url: URL(string: genreImg)){ image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                //                .frame(width: 170, height: 170)
                    .background(genreColor.randomElement())
                    .cornerRadius(10)
                    .padding(.bottom, 15)
                    .brightness(-0.2)
                    .blur(radius: 1)
            } placeholder: { // imageUrl값이 없을 때
                Image("플리닉로고")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                //                .frame(width: 170, height: 170)
                    .background(genreColor.randomElement())
                    .cornerRadius(10)
                    .padding(.bottom, 15)
                    .brightness(-0.6)
                    .blur(radius: 1)
            }
            
            Text(genreName)
                .font(.system(size: 36))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
        }
        
        
        
    }
}

struct GenreThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        GenreThumbnail(genreImg: "defaultImg", genreName: "Happy")
    }
}

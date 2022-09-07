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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
            Image(genreImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.bottom, 15)
                .brightness(-0.2)
                .blur(radius: 1)
            
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

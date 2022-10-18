//
//  thumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct Thumbnail: View {
    
    var thumbnail : String // 썸네일 이미지에 대한 변수
    //    var title : String // 썸네일 타이틀에 대한 변수
    
    var body: some View {
        
            Image(thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.green)
                .cornerRadius(10)
        
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Thumbnail(thumbnail: "defaultImg")
    }
}

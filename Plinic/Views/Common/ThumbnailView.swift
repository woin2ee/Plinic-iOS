//
//  thumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct ThumbnailView: View {
    
    var imageUrl: String
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: imageUrl)){ image in
                image
                    .resizable()
                    .frame(minWidth: 170, maxWidth: 200, minHeight: 170 , maxHeight: 200)
                    .scaledToFit()
                    .aspectRatio(1, contentMode: .fill)
                    .cornerRadius(10)
            } placeholder: { // imageUrl값이 없을 때
                Image("defaultImg")
                    .resizable()
                    .frame(minWidth: 170, maxWidth: 200, minHeight: 170 , maxHeight: 200)
                    .scaledToFit()
                    .aspectRatio(1, contentMode: .fill)
                    .cornerRadius(10)
            }
        } // VStack
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(imageUrl: "")
    }
}

//
//  thumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct ThumbnailView: View {
    
    var baseUrl: String = "https://plinic-api-server.ml"
    
    var imageUrl: String
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: "\(baseUrl)\(imageUrl)")) { image in
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
            .onAppear() {
                print("Thumbnail!!!")
                print("\(baseUrl)\(imageUrl)")
            }
        } // VStack
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(imageUrl: "/media/thumbnails/2022/10/27/%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%84%89%E1%85%B3%E1%84%86%E1%85%A1%E1%84%89%E1%85%B3.jpeg")
    }
}

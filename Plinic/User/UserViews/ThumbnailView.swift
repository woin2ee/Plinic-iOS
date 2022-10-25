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
            Image(imageUrl)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(10)
        } // VStack        
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(imageUrl: "defaultImg")
    }
}

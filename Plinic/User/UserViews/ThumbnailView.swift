//
//  thumbnail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct ThumbnailView: View {
    
    var imageUrl: String
    @State private var selectedColor: Color = .red.opacity(0)
    @State var isSelect: Bool = false
    @State private var count: Int = 0
    
    var body: some View {
        
        VStack{
            Image(imageUrl)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .background(Color.green)
                .cornerRadius(10)
        } // VStack
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(selectedColor, lineWidth: 5))
        .onTapGesture {
            self.isSelect.toggle()
            if isSelect == true{
                self.selectedColor = .red
                self.count += 1
            } else {
                self.selectedColor = .red.opacity(0)
                self.count -= 1
            }
            
        }
        
    }
}

struct Thumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(imageUrl: "defaultImg")
    }
}

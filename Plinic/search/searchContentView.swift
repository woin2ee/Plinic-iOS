//
//  searchContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/30.
//

import SwiftUI

struct SearchContentView: View {
    
    var genre = ["Happy", "Sad", "Jazz", "Acoustic", "Blues", "Classical", "Children", "R&B"]
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                NavigationView {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        Text("Searching for \(searchText)")
                            .searchable(text: $searchText, prompt: "검색어를 입력하세요.")
                            .foregroundColor(Color.white)
                    }
                } // SearchBar
                
                ScrollView{
                    VStack{
                        ForEach( Array(stride(from: 0, to: self.genre.count, by: 2)), id: \.self) { index in
                            HStack{
                                GenreThumbnail(genreImg: "defaultImg", genreName: "\(genre[index])")
                                if genre[index+1].isEmpty {
                                    //                                (이때, genre안에 있는 요소가 짝수가 아닌 홀수 일때에 오류가 남) <- 오류처리 필요
                                }
                                else {
                                    GenreThumbnail(genreImg: "defaultImg", genreName: "\(genre[index+1])")
                                }
                            } // HStack
                        } //Foreach 0부터 시작해서 2의 간격으로 index를 출력 (이때, genre안에 있는 요소가 짝수가 아닌 홀수 일때에 오류가 남) <- 오류처리 필요
                    } // VStack
                } // ScrollView
            }
            
        } // ZStack
    }
}

struct SearchContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView()
    }
}

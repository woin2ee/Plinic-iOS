//
//  searchContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/30.
//

import SwiftUI

struct SearchContentView: View {
    
    var genre = ["Happy", "Sad", "Jazz", "Acoustic", "Blues", "Classical", "Children", "R&B", "K-POP"]
    var columns = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                SearchBar()
                    .frame(height: 50)
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(genre, id: \.self) {i in
                            NavigationLink(destination: postContentView()){
                                GenreThumbnail(genreImg: "defaultImg", genreName: "\(i)")
                            } // NavigationLink
                            .navigationBarTitleDisplayMode(.inline)
//                            .navigationTitle("\(i)")
                        } //Foreach
                    } // VStack
                } // ScrollView
            } // VStack
            .onTapGesture {
                hideKeyboard()
            } // 화면 터치 했을 때 키보드 내리기
            
        } // ZStack
    }
}

struct SearchContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView()
    }
}

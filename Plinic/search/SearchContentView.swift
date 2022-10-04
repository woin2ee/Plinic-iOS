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
                            GenreThumbnail(genreImg: "defaultImg", genreName: "\(i)")
                        } //Foreach 0부터 시작해서 2의 간격으로 index를 출력 (이때, genre안에 있는 요소가 짝수가 아닌 홀수 일때에 오류가 남) <- 오류처리 필요
                    } // VStack
                } // ScrollView
            } // VStack
            
        } // ZStack
    }
}

struct SearchContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
// 화면 터치시에 키보드 내려가는 코드 구현

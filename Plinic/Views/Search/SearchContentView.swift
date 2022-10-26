//
//  searchContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/30.
//

import SwiftUI

struct SearchContentView: View {
    
    @StateObject var genreAPI: GenreAPI = GenreAPI()
    
    @State var genres: Genres = .createEmpty()
    
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
                        ForEach(genres, id: \.self) { genre in
                            NavigationLink(destination: PostSearchView(navigationTitle: genre)){
                                GenreThumbnail(genreImg: "", genreName: genre)
                            } // NavigationLink
                        } //Foreach
                        .onAppear(){
                            genreAPI.getGenres() { result in
                                switch result {
                                case .success(let success):
                                    self.genres = success
                                case .failure(let failure):
                                    _ = failure
                                }
                            }
                        }
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
        SearchContentView(genres: .createMock())
    }
}

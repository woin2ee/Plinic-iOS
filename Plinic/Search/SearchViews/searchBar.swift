//
//  searchBar.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/06.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var searchText = ""
    @State var searching: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundColor(Color.MainColor)
                    .frame(minWidth: 30, minHeight: 30)
                ZStack(alignment: .leading){
                    if searchText.isEmpty{
                        Text("검색어를 입력하세요.")
                            .foregroundColor(Color.gray)
                    }
                    TextField("", text: $searchText)
                        .foregroundColor(Color.white)
                        .font(.title2)
                } // 텍스트 필드
                .onSubmit {
                    print("\(searchText) (이)가 검색되었습니다.")
                    searching = true
                }
                
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "x.circle.fill")
                        .padding(.trailing, 10)
                })
            } // 검색어 창
            .padding(.leading)
            .frame(minWidth: 300, minHeight: 44)
            .background(Color.BackgroundSubColor)
            .cornerRadius(10)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}


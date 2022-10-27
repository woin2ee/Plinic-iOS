//
//  searchResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/07.
//

import SwiftUI

struct SearchResultView: View {
    
    private let searchAPI: SearchAPI = .init()
    private let postAPI: PostAPI = .init()
    
    @Binding var searchText: String
    @State private var searchResult: SearchResult = .createEmpty()
    private var displayedUsers: [UserInfo] {
        if searchResult.users.count >= 2 {
            return .init(searchResult.users[searchResult.users.startIndex..<2])
        } else {
            return .init(searchResult.users[searchResult.users.startIndex..<searchResult.users.count])
        }
    }
    
    @State private var tempPostSearchResult: PostList = .createEmpty()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack() {
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("유저")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: MoreUserResultsView(users: $searchResult.users)) {
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.blue)
                            }
                            .padding(.trailing, 15)
                        }//HStack
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(minWidth: 200, maxHeight: 2)
                            .padding(.top, 10)
                            .padding(.leading, 10)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(minWidth: 300, maxHeight: 20, alignment: .leading)
                            .padding([.top, .leading], 10)
                        
                        
                        HStack(alignment: .bottom) {
                            ForEach(displayedUsers, id: \.uuid) { userInfo in
                                NavigationLink(destination:
                                                OtherUserView(nickName: userInfo.nickName)){
                                    UserResult(
                                        profileImg: userInfo.profileImageUrl ?? "defaultImg",
                                        nickName: userInfo.nickName
                                    )
                                    .padding(.leading, 10)
                                }

//                                userTopResult(
//                                    profileImg: "",
//                                    nickName: "Hi",
//                                    infoCount: 12
//                                )
                            }
                        }//HStack
                        .padding()
                        .padding(.top, 10)
                        
                        
                        
                    }//VStack
                    .padding(.leading, 10)
                }//HStack
                
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("게시글")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            // FIXME: 검색어와 관련된 post list 보여주도록 구현 필요
                            NavigationLink(destination: PostSearchView(navigationTitle: searchText)){
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.blue)
                            }
                            .padding(.trailing, 15)
                        }//HStack
                        Rectangle()
                            .fill(Color.white)
                            .frame(minWidth: 200, maxHeight: 2)
                            .padding(.top, 10)
                            .padding(.leading, 10)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(minWidth: 300, maxHeight: 20, alignment: .leading)
                            .padding([.top, .leading], 10)
                        ScrollView(.horizontal) {
                            HStack(spacing:15) {
                                ForEach(tempPostSearchResult.results, id: \.uuid) { post in
                                    NavigationLink(
                                        destination: {
                                            PostDetailView(postId: post.id)
                                        },
                                        label: {
                                            VStack() {
                                                ThumbnailView(imageUrl: post.plInfo.thumbnailImgURL ?? "defaultImg")
                                                    .frame(width: 170, height: 170) //FIXME: - release용
                                                Text("\(post.title)")
                                                    .foregroundColor(Color.white)
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 180, height: 20, alignment: .center) //FIXME: - release용
                                            }//VStack
                                        }
                                    )
                                } //ForEach
                            }//HSTack
                        }
                        .frame(maxHeight: 200, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    }//VStack
                    .padding(.leading, 10)
                }//HStack
                .padding(.top, 15)
            }//VStack
            .navigationTitle(searchText)
            .navigationBarTitleDisplayMode(.automatic)
        }//ZStack
        .onLoad() {
            searchAPI.getSearchResult(by: searchText) { result in
                switch result {
                case .success(let searchResult):
                    self.searchResult = searchResult
                case .failure(let error):
                    _ = error
                }
            }
            postAPI.getPostList { result in
                switch result {
                case .success(let postList):
                    self.tempPostSearchResult = postList
                case .failure(let error):
                    _ = error
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchText: .constant("재즈"))
    }
}

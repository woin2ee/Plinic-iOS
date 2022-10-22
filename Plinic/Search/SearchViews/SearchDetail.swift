//
//  searchDetail.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/19.
//

import SwiftUI



struct userDetail: View {
    
    @State private var sort: Int = 0
    
    var user = [User(userName: "Leeo",userImg: "random1",playlistCount: 029),
                User(userName: "Lisa",userImg: "random1",playlistCount: 019),
                User(userName: "Sven",userImg: "random1",playlistCount: 027),
                User(userName: "Leeo",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo2",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo3",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo4",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo5",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo6",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo7",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo8",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo9",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo10",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo11",userImg: "random1",playlistCount: 029),
                User(userName: "Leeo12",userImg: "random1",playlistCount: 029)]
    
    var body: some View {
        List{
            Section(header: Text("유저")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color.black)){
                ForEach(user, id: \.id) {user in
                    HStack{
                        Image("\(user.userImg)")
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
                            .frame(maxWidth: 80, maxHeight: 80, alignment: .center)
                            .frame(width: 100, height: 100, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Spacer()
                            Text("\(user.userName)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.bottom, 5)
                            Text("플레이리스트: \(user.playlistCount)")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Spacer()
                        }//VStack
                    }//HStack
                }//ForEach
                .padding(.leading, 10)
                .listRowBackground(Color.black)
                .listRowInsets(EdgeInsets())
            }//Section
        }//List
        .onAppear {
            UITableView.appearance().backgroundColor = .black  // 테이블 뷰 배경 투명
            UITableView.appearance().separatorColor = .white // 구분선 색상
        }
        .background(Color.black)
        .listStyle(GroupedListStyle())
//        .toolbar(content: {
//            ToolbarItem(placement: .primaryAction,
//                content: {
//
//                Menu(content: {
//                    Button("정확도", action: {
//                        // 나중에 정화도 순으로 정렬 시키는 코드 추가
//                    })
//                    Button("플레이리스트", action: {
//                        // 나중에 플레이리스트 순으로 정렬 시키는 코드 추가
//                    })
//                    Button("가나다", action: {
//                        // 나중에 가나다 순으로 정렬 시키는 코드 추가
//                    })
//                }, label: {
//                    Label("more", systemImage: "ellipsis")
//
//                })
//
//            })
//        })
// 검색결과를 정렬하는 버튼
        
    }
}

struct userDetail_Previews: PreviewProvider {
    static var previews: some View {
        userDetail()
    }
}

struct User: Identifiable {
    var id = UUID()
    var userName: String
    var userImg: String
    var playlistCount: Int
}



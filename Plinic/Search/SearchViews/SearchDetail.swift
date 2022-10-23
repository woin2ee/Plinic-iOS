//
//  searchDetail.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/19.
//

import SwiftUI

struct userDetail: View {
    
    @State private var sort: Int = 0
    
    var users: [UserInfo] = [
        UserInfo(id: 1, nickName: "Test1", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 2, nickName: "Test2", profileImageUrl: "random1", myPlaylists: ["1", "2"], scrappedPlaylists: ["1"]),
        UserInfo(id: 3, nickName: "Test3", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 4, nickName: "Test4", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 5, nickName: "Test5", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 6, nickName: "Test6", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 7, nickName: "Test7", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 8, nickName: "Test8", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 9, nickName: "Test9", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 10, nickName: "Test10", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"]),
        UserInfo(id: 11, nickName: "Test11", profileImageUrl: "random1", myPlaylists: ["1"], scrappedPlaylists: ["1"])
    ]
    
    var body: some View {
        List{
            Section(header: Text("유저")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color.black)) {
                    ForEach(users, id: \.uuid) { user in
                        HStack{
                            Image("\(user.profileImageUrl)")
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
                                .frame(maxWidth: 80, maxHeight: 80, alignment: .center)
                                .frame(width: 100, height: 100, alignment: .center)
                            
                            VStack(alignment: .leading){
                                Spacer()
                                Text("\(user.nickName)")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .padding(.bottom, 5)
                                Text("플레이리스트: \(user.myPlaylists.count)")
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

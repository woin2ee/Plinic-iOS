//
//  MoreUserResultsView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/19.
//

import SwiftUI

struct MoreUserResultsView: View {
    
    @State private var sort: Int = 0
    
    @Binding var users: [OtherUserInfo]
    
    var body: some View {
        List{
            Section(header: Text("유저")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color.black)) {
                    ForEach(users, id: \.uuid) { user in
                        NavigationLink(destination: OtherUserView(nickName: user.nickName)){
                            HStack{
                                AsyncImage(url: URL(string: "https://plinic-api-server.ml\(user.profileImageUrl ?? "")")){ image in
                                    image
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle()
                                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
                                        .frame(maxWidth: 80, maxHeight: 80, alignment: .center)
                                        .frame(width: 100, height: 100, alignment: .center)
                                } placeholder: { // imageUrl값이 없을 때
                                    Image("플리닉로고")
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle()
                                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 3))
                                        .frame(maxWidth: 80, maxHeight: 80, alignment: .center)
                                        .frame(width: 100, height: 100, alignment: .center)
                                }
                                
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text("\(user.nickName)")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 25))
                                        .padding(.bottom, 5)
                                    Text("플레이리스트: \(user.publicPlaylists.count)")
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    Spacer()
                                }//VStack
                            }//HStack
                        }
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
        MoreUserResultsView(users: .constant([
            .createMock(),
            .createMock(),
            .createMock(),
            .createMock(),
            .createMock()
        ]))
    }
}

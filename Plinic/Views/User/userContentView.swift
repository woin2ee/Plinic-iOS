//
//  UserContentView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/07/31.
//

import SwiftUI

struct UserContentView: View {
    
    let userAPI: UserAPI = .init()
    
#if RELEASE
    @State var userInfo: UserInfo = .createEmpty()
#elseif DEBUG
    @State var userInfo: UserInfo = .createMock()
#endif
    
    @State private var postTransform = true
    
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack{
                
                GeometryReader{ geometry in
                    
                    VStack(spacing:0) {
                        
                        HStack(spacing:0) {
                            
                            Text("\(userInfo.nickName)")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                                .tracking(-0.41)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.05, alignment: .leading)
                            //유저 이름
                            
                            NavigationLink(destination: PlaylistCreateView(genres: [""])){
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color.MainColor)
                                    .padding(.trailing, 15.0)
                            }
                            // 플레이리스트 추가버튼
                            
                            Button(action: {
                                self.postTransform.toggle()
                            }, label: {
                                Image(systemName: "music.note.list")
                                    .padding(.trailing, 10.0)
                                    .font(.system(size: 35))
                                    .foregroundColor(Color.MainColor)
                            })
                            
                        }
                        .padding(.leading, 10.0)
                        // HStack : 타이틀 부분
                        
                        VStack{
                            
                            UserInfoView(userInfo: $userInfo)
                                .frame(height: geometry.size.height * 0.25)
                                .padding(.top, 10)
                            // 유저 정보 부분
                            
                            NavigationLink(
                                isActive: $isEditing,
                                destination: {
                                    UserProfileEditView(
                                        genres: ["String"], userInfo: $userInfo,
                                        userName: userInfo.nickName,
                                        genre1: "Aucoustic",
                                        genre2: "Sad",
                                        genre3: "Happy",
                                        isEditing: $isEditing
                                    )
                                },
                                label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.BackgroundSubColor)
                                            .frame(width: 330, height: 40)
                                        
                                        Text("프로필 편집")
                                            .fontWeight(.bold)
                                            .font(.system(size: 12))
                                            .foregroundColor(Color.white)
                                    }
                                }
                            )
                            .padding(.bottom, 20)
                            
                            if(self.postTransform) {
                                UserMyPlaylistView(userInfo: $userInfo)
                                    .frame(height: geometry.size.height * 0.65)
                                Spacer()
                                    .frame(height: geometry.size.height * 0.15)
                            } else {
                                UserPostView(userInfo: $userInfo)
                                    .frame(height: geometry.size.height * 0.65)
                            }
                            
                        }
                        // VStack
                    }
                    // VStack
                }
                // GeometryReader
            }
            // VStack
        }
        .onAppear() {
            userAPI.getUserInfo(by: "plinic") { result in
                switch result {
                case .success(let userInfo):
                    self.userInfo = userInfo
                case .failure(let error):
                    print(error)
                }
            }
        }
        // ZStack
    }
}

struct UserContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserContentView()
            UserContentView()
                .previewDevice("iPhone 8")
        }
    }
}


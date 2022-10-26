//
//  OtherUserView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/26.
//

import SwiftUI

struct OtherUserView: View {
    
    let userAPI: UserAPI = .init()
    
    @State var userInfo: UserInfo = .createEmpty()
    
    @State private var postTransform = true
    @State var nickName: String?
    
    var body: some View {
        NavigationView(){
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack{
                    
                    GeometryReader{ geometry in
                        
                        VStack{
                            
                            //                            HStack(spacing:0) {
                            //
                            //                                Text("\(userInfo.nickName)")
                            //                                    .fontWeight(.bold)
                            //                                    .font(.system(size: 20))
                            //                                    .foregroundColor(Color.white)
                            //                                    .tracking(-0.41)
                            //                                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.05, alignment: .leading)
                            //                                //유저 이름
                            //
                            //                            }
                            //                            .padding(.leading, 10.0)
                            //                            // HStack : 타이틀 부분
                            
                            VStack{
                                
                                UserInfoView(userInfo: $userInfo)
                                    .frame(height: geometry.size.height * 0.25)
                                    .padding(.top, 10)
                                // 유저 정보 부분
                                
                                if(self.postTransform) {
                                    OtherUserPlaylistView(userInfo: $userInfo)
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
            }
            .onAppear() {
                userAPI.getUserInfo(by: nickName ?? "Lami") { result in
                    switch result {
                    case .success(let userInfo):
                        self.userInfo = userInfo
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        .navigationTitle(userInfo.nickName)
        .navigationBarItems(trailing:
                                Button(action: {
            self.postTransform.toggle()
        }, label: {
            Image(systemName: "music.note.list")
                .padding(.trailing, 10.0)
                .font(.system(size: 20))
                .foregroundColor(Color.MainColor)
        }))
        
        
    }
}

struct OtherUserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OtherUserView()
            OtherUserView()
                .previewDevice("iPhone 8")
        }
    }
}


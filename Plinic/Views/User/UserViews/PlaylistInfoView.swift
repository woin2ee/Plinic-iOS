//
//  PlaylistInfoView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct PlaylistInfoView: View {
    
    @State private var someToggle = true
    
    @Binding var playlistDetail: PlaylistDetail
    
    let userAPI: UserAPI = .init()
    @State var userInfo: UserInfo = .createEmpty()
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            GeometryReader { geo in
                HStack{
                    ThumbnailView(imageUrl: playlistDetail.thumbnailImgURL ?? "defaultImg")
                        .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.2)
                        .padding(.leading, 10)
                    
                    VStack{
                        Text(playlistDetail.title)
                            .font(.system(size: 12))
                            .foregroundColor(Color.white)
                            .fontWeight(.heavy)
                            .frame(width: geo.size.width * 0.5, height: 20, alignment: .leading)
                        
                        HStack{
                            Text("\(playlistDetail.trackName.count) 곡")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                                .fontWeight(.medium)
                                .frame(width: geo.size.width * 0.2, height: 20, alignment: .leading)
                                .padding(.leading, 10)
                            Spacer()
                            //MARK: - 유저 정보에 맞는 수정, 삭제 버튼
//                            if userInfo.publicPlaylists.contains(where: { $0.id == playlistDetail.id } ) || userInfo.privatePlaylists.contains(where: { $0.id == playlistDetail.id } ) {
//
//                                Button(action: {
//                                    // 수정 구현
//                                }, label: {
//                                    Text("수정")
//                                        .padding(5)
//                                        .foregroundColor(.MainColor)
//                                        .cornerRadius(10)
//                                        .frame(maxWidth: 44, maxHeight: 44, alignment: .trailing)
//                                })
//
//                                Button(action: {
//                                    // 삭제 구현
//                                }, label: {
//                                    Text("삭제")
//                                        .padding(5)
//                                        .foregroundColor(.red)
//                                        .cornerRadius(10)
//                                        .frame(maxWidth: 44, maxHeight: 44, alignment: .trailing)
//                                })
//                            }
                        }
                        
                        HStack{
                            GenreTagView(genreName: playlistDetail.genreName)
                        }
                        .frame(width: geo.size.width * 0.5, height: 30, alignment: .leading)
                        .padding([.top, .bottom], 10)
                        //MARK: - release 브랜치에서 빼야할 내용
//                        HStack{
//                            Image(systemName: "square.and.arrow.up")
//                                .font(.system(size: 31))
//                                .padding(.trailing,10)
//                                .foregroundColor(Color.white)
//
//                            VStack {
//                                // MARK: 아직 API 미구현
//                                Toggle("공개", isOn: $someToggle)
//                                    .padding(.leading, 5.0)
//                                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
//                                    .font(.headline)
//                                    .foregroundColor(Color.white)
//                                //                        someToggle ? Text("공개 되었습니다.") : Text("비공개 되었습니다.") // 스위치를 클릭했을 때 백엔드에게 공개 비공개 값을 알려주도록 설정
//                            }
//                            .padding(.trailing, 10)
//                            .frame(width: geo.size.width * 0.35, height: 41)
//                            .background(Color.BackgroundSubColor)
//                            .cornerRadius(10)
//                        } // HStack
                    } // VStack
                } // HStack
            } //ZStack
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
        }
    }
}

struct PlaylistInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistInfoView(playlistDetail: .constant(.createMock()))
    }
}

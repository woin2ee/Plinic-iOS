//
//  UserProfileEditView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/05.
//

import SwiftUI

struct UserProfileEditView: View {
    
    @StateObject var genreAPI: GenreAPI = GenreAPI()
    @State var genres: [String]
    
    @Binding var userInfo: UserInfo
    
    @State var userName: String
    
    @State var genre1 : String = ""
    @State var genre2 : String = ""
    @State var genre3 : String = ""
    
    var chooseGenre = ["genre1", "genre2", "genre3"]
    
    @StateObject var kakoAuthVM: KakaoAuthVM = KakaoAuthVM.shared
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: userInfo.profileImageUrl))
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .overlay(Circle()
                        .stroke(Color.MainColor, lineWidth: 5))
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                // 프로필 사진을 보여줌
                
                Button(action: {
                    // 이미지피커를 이용하여 작성할 코드
                }, label: {
                    Text("프로필 사진 변경")
                        .frame(width: 102, height: 22)
                        .padding(.all, 10)
                        .foregroundColor(Color.MainColor)
                        .background(Color.BackgroundSubColor)
                        .font(.system(size: 15))
                        .cornerRadius(5)
                    //                        .overlay(RoundedRectangle(cornerRadius: 5)
                    //                            .stroke(Color.MainColor, lineWidth: 1))
                        .padding(.bottom, 40)
                }) // 프로필 사진 변경하고 싶을 때 누르는 버튼
                
                
                ZStack(alignment: .leading){
                    if userName.isEmpty{
                        Text("Enter your Nickname")
                            .foregroundColor(Color.gray)
                    }
                    TextField("", text: $userName)
                        .foregroundColor(Color.MainColor)
                }
                .padding(.leading)
                .frame(width: 350, height: 44)
                .background(Color.BackgroundSubColor)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.MainColor, lineWidth: 1))
                .padding(.bottom, 20)
                .onSubmit {
                    userName = "\(userName)"
                    print("유저 닉네임 : \(userName)")
                }
                // 닉네임을 변경하고 싶을 때 사용하는 텍스트 필드
                
                Text("Genre")
                    .font(.system(size: 25))
                    .foregroundColor(Color.MainColor)
                    .padding(.trailing, 290)
                
                
                VStack {
                    Picker("Choose a first genre", selection: $genre1) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                                .foregroundColor(Color.MainColor)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 50)
                    .background(Color.BackgroundSubColor)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                    
                } // 좋아하는 장르 선택 1
                
                VStack {
                    Picker("Choose a second genre", selection: $genre2) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                                .foregroundColor(Color.MainColor)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 50)
                    .background(Color.BackgroundSubColor)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                } // 좋아하는 장르 선택 2
                VStack {
                    Picker("Choose a third genre", selection: $genre3) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                                .foregroundColor(Color.MainColor)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 50)
                    .background(Color.BackgroundSubColor)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                } // 좋아하는 장르 선택 1
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
                
                HStack{
                    Button(action: {
                        kakoAuthVM.KakaoLogout()
                        // 클릭 했을 때 로그아웃이 되는 코드 작성
                    }, label: {
                        Text("로그아웃")
                            .foregroundColor(Color.MainColor)
                            .frame(width: 110, height: 50)
                            .background(Color.BackgroundSubColor)
                            .cornerRadius(30)
                    })
                    
                    Button(action: {
                        // 클릭 했을 때 회원 탈퇴 절차를 밟는 코드 작성
                    }, label: {
                        Text("회원 탈퇴")
                            .foregroundColor(Color.MainColor)
                            .frame(width: 110, height: 50)
                            .background(Color.BackgroundSubColor)
                            .cornerRadius(30)
                    })
                    
                    Button(action: {
                        // 클릭 했을 때 변경된 정보들을 저장하고 넘어가는 코드 작성
                    }, label: {
                        Text("확인")
                            .foregroundColor(Color.MainColor)
                            .frame(width: 110, height: 50)
                            .background(Color.BackgroundSubColor)
                            .cornerRadius(30)
                    })
                } // 하단 버튼 모음
                .padding(.top, 20)
            } // VStack
            .onTapGesture {
                hideKeyboard()
            } // 화면 터치 했을 때 키보드 내리기
        } // ZStack
    }
    
}



struct UserProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileEditView(
                genres: [""],
                userInfo: .constant(.createMock()),
                userName: "Test",
                genre1: "Aucoustic",
                genre2: "Sad",
                genre3: "Happy"
            )
            UserProfileEditView(
                genres: [""],
                userInfo: .constant(.createMock()),
                userName: "Test",
                genre1: "Aucoustic",
                genre2: "Sad",
                genre3: "Happy"
            )
            .previewDevice("iPhone SE (3rd generation)")
        }
    }
}


//
//  UserProfileEditView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/05.
//

import SwiftUI
import PhotosUI

struct UserProfileEditView: View {
    
    @StateObject var genreAPI: GenreAPI = GenreAPI()
    @State var genres: [String]
    
    @Binding var userInfo: UserInfo
    
    @State var userName: String
    
    @State var genre1 : String = ""
    @State var genre2 : String = ""
    @State var genre3 : String = ""
    
    var chooseGenre = ["genre1", "genre2", "genre3"]
    
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @StateObject var kakoAuthVM: KakaoAuthVM = KakaoAuthVM.shared
    
    @Binding var isEditing: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                
                if profileImage == nil {
                    AsyncImage(url: URL(string: "https://plinic-api-server.ml\(userInfo.profileImageUrl ?? "")"))
                        .aspectRatio(1, contentMode: .fit)
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 5))
                        .clipShape(Circle())
                        .padding(.bottom, 20)
                } else {
                    profileImage?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 5))
                        .clipShape(Circle())
                        .padding(.bottom, 20)
                }
                // 프로필 사진을 보여줌
                
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    Text("프로필 사진 변경")
                        .frame(width: 102, height: 22)
                        .padding(.all, 10)
                        .foregroundColor(Color.MainColor)
                        .background(Color.BackgroundSubColor)
                        .font(.system(size: 15))
                        .cornerRadius(5)
                        .padding(.bottom, 40)
                }) // 프로필 사진 변경하고 싶을 때 누르는 버튼
                .sheet(isPresented: $imagePickerPresented,
                       onDismiss: loadImage,
                       content: { ImagePicker(image: $selectedImage) })
                
                
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
                .onAppear() {
                    genreAPI.getGenres() { genres in
                        if let genres = genres {
                            self.genres = genres
                            self.genre1 = genres.randomElement() ?? ""
                            self.genre2 = genres.randomElement() ?? ""
                            self.genre3 = genres.randomElement() ?? ""
                        }
                    }
                }
                
                HStack{
                    Button(action: {
                        kakoAuthVM.KakaoLogout()
                        // 클릭 했을 때 로그아웃이 되는 코드 작성
                    }, label: {
                        Text("로그아웃")
                            .foregroundColor(Color.red)
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
//                        //FIXME: - 바뀐 정보들이 POST 되는 버튼
//                        if profileImage != nil {
//                            // 프로필 사진을 변경 했을 때 실행 되는 코드
//                        }
                        self.isEditing = false
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
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    } // 변경된 프로필사진을 Image 타입으로 profileImage에 저장
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
                genre3: "Happy",
                isEditing: .constant(true)
            )
            UserProfileEditView(
                genres: [""],
                userInfo: .constant(.createMock()),
                userName: "Test",
                genre1: "Aucoustic",
                genre2: "Sad",
                genre3: "Happy",
                isEditing: .constant(true)
            )
            .previewDevice("iPhone SE (3rd generation)")
        }
    }
}


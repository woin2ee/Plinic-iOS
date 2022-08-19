//
//  userProfile.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/05.
//

import SwiftUI

struct UserProfile: View {
    
    var profileImg : String // 유저의 프로필 사진
    
    @State var name: String // 유저의 닉네임
    
    var genre = ["Aucoustic", "Jazz", "Sad", "Happy"] // 장르의 이름을 담은 배열
    
    @State  var genre1 : String = ""
    @State  var genre2 : String = ""
    @State  var genre3 : String = ""
    // 유저가 선택한 장르
    
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                Image(profileImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Circle()
                        .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 5))
                    .frame(width: 100, height: 100)
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                // 프로필 사진을 보여줌
                
                
                Button(action: {
                    // 이미지피커를 이용하여 작성할 코드
                }, label: {
                    Text("프로필 사진 변경")
                        .frame(width: 102, height: 22)
                        .padding(.all, 5)
                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                        .font(.system(size: 15))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                        .padding(.bottom, 50)
                }) // 프로필 사진 변경하고 싶을 때 누르는 버튼
                
                
                ZStack(alignment: .leading){
                    if name.isEmpty{
                        Text("Enter your Nickname")
                            .foregroundColor(Color.gray)
                    }
                    TextField("", text: $name)
                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                }
                .padding(.leading)
                .frame(width: 350, height: 44)
                .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                .padding(.bottom, 20)
                // 닉네임을 변경하고 싶을 때 사용하는 텍스트 필드
                
                Text("Genre")
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                    .padding(.trailing, 290)
                
                
                VStack {
                    Picker("Choose a first genre", selection: $genre1) {
                        ForEach(genre, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 44)
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .cornerRadius(15)
                    
                } // 좋아하는 장르 선택 1
                VStack {
                    Picker("Choose a second genre", selection: $genre2) {
                        ForEach(genre, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 44)
                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .cornerRadius(15)
                } // 좋아하는 장르 선택 2
                VStack {
                    Picker("Choose a third genre", selection: $genre3) {
                        ForEach(genre, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                        }
                    }
                    .font(.system(size: 20))
                    .pickerStyle(.menu)
                    .frame(width: 350, height: 44)
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .cornerRadius(15)
                } // 좋아하는 장르 선택 1
                
                HStack{
                    Button(action: {
                        // 클릭 했을 때 로그아웃이 되는 코드 작성
                    }, label: {
                        Text("로그아웃")
                            .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                            .frame(width: 110, height: 50)
                            .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            .cornerRadius(30)
                    })
                    
                    Button(action: {
                        // 클릭 했을 때 회원 탈퇴 절차를 밟는 코드 작성
                    }, label: {
                        Text("회원 탈퇴")
                            .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                            .frame(width: 110, height: 50)
                            .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            .cornerRadius(30)
                    })
                    
                    Button(action: {
                        // 클릭 했을 때 변경된 정보들을 저장하고 넘어가는 코드 작성
                    }, label: {
                        Text("확인")
                            .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                            .frame(width: 110, height: 50)
                            .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            .cornerRadius(30)
                    })
                } // 하단 버튼 모음
                .padding(.top, 20)
            } // VStack
        } // ZStack
    }
    
}



struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(profileImg: "random1", name: "돼우", genre1: "Aucoustic", genre2: "Sad", genre3: "Happy")
    }
}


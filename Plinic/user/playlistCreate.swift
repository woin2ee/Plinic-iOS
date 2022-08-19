//
//  playlistCreate.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/20.
//

import SwiftUI

struct playlistCreate: View {
    
    @State var playlistName: String = "" // 플리제목
    @State var musicCount: String = ""
    @State var musicTitle: String = ""
    @State private var someToggle = true
    
    var genre = ["Aucoustic", "Jazz", "Sad", "Happy"] // 장르의 이름을 담은 배열
    
    @State var genre1 : String = ""
    
    var body: some View {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Thumbnail(thumbnail: "defaultImg")
                            .padding(.trailing, 20.0)
                        VStack(alignment: .trailing, spacing:22) {
                            TextField("곡 개수", text: $musicCount)
                                .keyboardType(.decimalPad)
                                .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                .frame(width: 160, height: 44, alignment: .center)
                                .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            Button(action: {
                                // 클릭 했을 때 사진변경
                            }, label: {
                                Text("사진 변경")
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                    .frame(width: 110, height: 41, alignment: .center)
                                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                    .cornerRadius(10)
                            })
                            Toggle("공개", isOn: $someToggle)
                                .padding(.leading, 5.0)
                                .toggleStyle(SwitchToggleStyle(tint: Color.green))
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .frame(width: 110, height: 41, alignment: .center)
                                .frame(width: 110, height: 41)
                                .background(Color(red: 0.149, green: 0.149, blue: 0.149))
                                .cornerRadius(10)
                            //                            someToggle ? Text("확인 되었습니다.") : Text("확인 버튼을 눌러주세요.") // 스위치를 클릭했을 때 백엔드에게 공개 비공개 값을 알려주도록 설정
                        }//VStack
                    }//HStack
                    .frame(height: 200)
                    .padding(.bottom, 10.0)
                    
                    TextField("플레이리스트 제목을 입력하세요", text: $playlistName)
                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                        .frame(width: 350, height: 44, alignment: .center)
                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                        .padding(.bottom, 10.0)
                    VStack(alignment: .trailing) {
                        Picker("Choose a first genre", selection: $genre1) {
                            ForEach(genre, id: \.self) {
                                Text($0)
                                    .fontWeight(.bold)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 350, height: 70)
                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                        .cornerRadius(15)
                        .padding(.bottom, 20.0)
                        HStack{
                            Button(action: {
                                // 클릭 했을 때 플리생성 취소
                            }, label: {
                                Text("취소")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                    .frame(width: 50, height: 41)
                                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                // 클릭 했을 때 플리생성 취소
                            }, label: {
                                Text("완료")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                    .frame(width: 50, height: 41)
                                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                    .cornerRadius(10)
                            })
                        }//HStack
                    }//VStack
                    Spacer()
                }//VStack
            }//ZStack
    }
}


struct playlistCreate_Previews: PreviewProvider {
    static var previews: some View {
        playlistCreate()
    }
}

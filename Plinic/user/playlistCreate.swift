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
                GeometryReader{ geo in
                    VStack {
                        HStack {
                            Thumbnail(thumbnail: "defaultImg")
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.25)
                                .padding([.leading, .trailing], 10)
                            
                            VStack(alignment: .trailing) {
                                ZStack(alignment: .leading){
                                    if musicCount.isEmpty{
                                        Text("곡 개수를 입력하세요.")
                                            .foregroundColor(Color.gray)
                                            .padding(.leading, 10)
                                    }
                                    TextField("\(musicCount)", text: $musicCount)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                        .padding(.leading, 10)
                                }
                                .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.067, alignment: .center)
                                .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                .padding(.bottom, 10)
                                
                                Button(action: {
                                    // 클릭 했을 때 사진변경
                                }, label: {
                                    Text("사진 변경")
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                        .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.067, alignment: .center)
                                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                        .padding(.bottom, 10)
                                })
                                Toggle("공개/비공개", isOn: $someToggle)
                                    .padding(.leading, 5.0)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                    .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.067, alignment: .center)
                                    .background(Color(red: 0.149, green: 0.149, blue: 0.149))
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                //                            someToggle ? Text("확인 되었습니다.") : Text("확인 버튼을 눌러주세요.") // 스위치를 클릭했을 때 백엔드에게 공개 비공개 값을 알려주도록 설정
                            }//VStack
                        }//HStack
                        .frame(height: 200)
                        .padding(.bottom, 10)
                        
                        
                        ZStack(alignment: .leading){
                            if playlistName.isEmpty{
                                Text("플레이리스트 제목을 입력하세요.")
                                    .foregroundColor(Color.gray)
                                    .padding(.leading, 10)
                            }
                            TextField("\(playlistName)", text: $playlistName)
                                .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                .padding(.leading, 10)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.08, alignment: .center)
                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                        .padding(.bottom, 10)
                        
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
                            .frame(width: geo.size.width, height: geo.size.height * 0.20)
                            .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                            .padding(.bottom, 30)
                            
                            HStack{
                                Button(action: {
                                    // 클릭 했을 때 플리생성 취소
                                }, label: {
                                    Text("취소")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                        .frame(width: 60, height: 50)
                                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                })
                                Button(action: {
                                    // 클릭 했을 때 플리생성 취소
                                }, label: {
                                    Text("완료")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                                        .frame(width: 60, height: 50)
                                        .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(red: 0.501, green: 0.93, blue: 0.601), lineWidth: 1))
                                })
                            }//HStack
                        }//VStack
                    }//VStack
                }
                
            }//ZStack
    }
}


struct playlistCreate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            playlistCreate()
            playlistCreate()
                .previewDevice("iPhone 8")
        }
    }
}

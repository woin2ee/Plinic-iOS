//
//  playlistInfo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/07/29.
//

import SwiftUI

struct PlaylistInfo: View {
    
    var playlistTitle : String
    var songs : String
    //    var open : Bool
    @State private var someToggle = true
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader{ geo in
                HStack{
                    Thumbnail(thumbnail: "defaultImg")
                        .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.2)
                        .padding(.leading, 10)
                    VStack{
                        Text(playlistTitle)
                            .font(.system(size: 12))
                            .foregroundColor(Color.white)
                            .fontWeight(.heavy)
                            .frame(width: geo.size.width * 0.5, height: 20, alignment: .leading)
                        Text(songs + " 곡")
                            .font(.system(size: 12))
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                            .frame(width: geo.size.width * 0.5, height: 20, alignment: .leading)
                        HStack{
                            GenreTagView(genreName: "Acoustic")
                            GenreTagView(genreName: "Acoustic")
                            GenreTagView(genreName: "Acoustic")
                        } // HStack
                        .frame(width: geo.size.width * 0.5, height: 30, alignment: .leading)
                        .padding([.top, .bottom], 10)
                        HStack{
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 31))
                                .padding(.trailing,10)
                                .foregroundColor(Color.white)
                            
                            VStack {
                                Toggle("공개", isOn: $someToggle)
                                    .padding(.leading, 5.0)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                //                        someToggle ? Text("공개 되었습니다.") : Text("비공개 되었습니다.") // 스위치를 클릭했을 때 백엔드에게 공개 비공개 값을 알려주도록 설정
                            }
                            .padding(.trailing, 10)
                            .frame(width: geo.size.width * 0.35, height: 41)
                            .background(Color.BackgroundSubColor)
                            .cornerRadius(10)
                        } // HStack
                    } // VStack
                } // HStack
            } //ZStack
            
        }
        
        
    }
}

struct playlistInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistInfo(playlistTitle: "비가 올때 듣고 싶은 플리", songs: "20")
    }
}

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
        HStack{
            Thumbnail(thumbnail: "defaultImg")
                .padding(.leading, 10)
            VStack{
                Text(playlistTitle)
                    .font(.system(size: 12))
                    .fontWeight(.heavy)
                    .frame(width: 180, height: 20, alignment: .leading)
                Text(songs + " 곡")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .frame(width: 180, height: 20, alignment: .leading)
                HStack{
                    genreInfo(userGenre: "Acoustic")
                } // HStack
                .frame(width: 180, height: 30, alignment: .leading)
                .padding(.bottom, 30)
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 31))
                        .padding(.trailing,10)
                    
                    VStack {
                        Toggle("공개", isOn: $someToggle)
                            .padding(.leading, 5.0)
                            .toggleStyle(SwitchToggleStyle(tint: Color.green))
                            .font(.headline)
                            .foregroundColor(Color.white)
//                        someToggle ? Text("확인 되었습니다.") : Text("확인 버튼을 눌러주세요.") // 스위치를 클릭했을 때 백엔드에게 공개 비공개 값을 알려주도록 설정
                    }
                    .frame(width: 106, height: 41)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                } // HStack
            } // VStack
        } // HStack
    }
}

struct playlistInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistInfo(playlistTitle: "비가 올때 듣고 싶은 플리", songs: "20")
    }
}

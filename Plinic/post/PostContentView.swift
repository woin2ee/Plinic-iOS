//
//  postContentView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/17.
//

import SwiftUI

struct postContentView: View {
    
    var topNotice : String
    let data = Array(1...17)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 0.503, green: 0.928, blue: 0.601))
                        .frame(width: 42, height: 42)
                        .padding(.leading, 2)
                    
                    Button(action: {
                        // 클릭 하면 공지 페이지로 넘어가는 기능 구현
                    }, label: {
                        Text("\(topNotice)")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding(.all, 5)
                            .frame(maxWidth: 300, maxHeight: 32)
                            .background(Color(red: 0.192, green: 0.192, blue: 0.201))
                            .foregroundColor(Color.gray)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        // 버튼을 클릭 했을 때 게시글 작성하는 페이지로 이동하는 코드 작성
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 35))
                            .foregroundColor(Color(red: 0.503, green: 0.928, blue: 0.601))
                            .frame(width: 42, height: 42)
                    })
                    .padding(.trailing, 5)
                } // 상단바 구현
                .frame(maxWidth: 390, maxHeight: 46)
                .foregroundColor(Color(red: 0.106, green: 0.106, blue: 0.106))
                .padding(.top, 2)
                
                ScrollView{
                    ForEach(data, id: \.self) {i in
                        postInfo(profileImg: "random1", userName : "userName", thumbnail: "defaultImg", postContext : "ddddsdasdasd asdasasdasd asdasdasd asdasdasdfghjagsdfjkhg asfasdfjlhgasdjkhf  asdfjkhg", postName: "게시글 제목", heartCnt: "300")
                    } //ForEach
                    
                    
                    
                } // 게시글 구현
            } // VStack
        } // ZStack
        
    }
}

struct postContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            postContentView(topNotice : "공지 제목입니다")
            postContentView(topNotice : "공지 제목입니다")
                .previewDevice("iPhone 8")
        }
    }
}

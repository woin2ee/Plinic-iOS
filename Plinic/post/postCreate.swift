//
//  postCreate.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostCreate: View {
    
    @State var postName : String
    @State var postContext : String
    
    @State var placeholderText: String = "내용을 입력하세요."
    
    let data = Array(1...17)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GeometryReader{ geo in
                
                VStack{
                    
                    ZStack(alignment: .leading){
                        if postName.isEmpty{
                            Text("제목을 입력하세요.")
                                .foregroundColor(Color.gray)
                        }
                        TextField("", text: $postName)
                            .foregroundColor(Color.white)
                            .font(.title2)
                    } // ZStack
                    .padding(.leading)
                    .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.05)
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .cornerRadius(10)
                    // 게시글 제목 텍스트 필드
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $postContext)
                            .font(.body)
                            .opacity(self.postContext.isEmpty ? 0.25 : 1)
                            .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                            .foregroundColor(Color.white)
                            .onAppear() {
                                UITextView.appearance().backgroundColor = .clear
                            }.onDisappear() {
                                UITextView.appearance().backgroundColor = nil
                            }
                        if self.postContext.isEmpty {
                            Text(placeholderText)
                                .frame(alignment: .topLeading)
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .disabled(true)
                                .padding(15)
                        }// placeholder
                    } // TextEditor
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .cornerRadius(10)
                    .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.5)
                    
                    Text("공개된 플레이리스트")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.05, alignment: .leading)
                        .font(.system(size: 20))
                    
                    Rectangle()
                        .foregroundColor(Color(red: 0.108, green: 0.109, blue: 0.119))
                        .frame(width: geo.size.width, height: 2)
                        .padding(.bottom, 5)
                    
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(data, id: \.self) {i in
                                VStack{
                                    Thumbnail(thumbnail: "defaultImg")
                                        .frame(height: 190)
                                    Text("비오는 날 듣기 좋은 노래")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 15))
                                        .fontWeight(.regular)
                                        .frame(maxWidth: 170, maxHeight: 15)
                                }
                                .padding(.trailing, 10)
                            } //ForEach
                            
                        } // 공개된 플레이리스트 정보
                    } // 스크롤뷰
                    
                    
                } // VStack
            }
        } // ZStack
        
    }
}

struct PostCreate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostCreate(postName: "wpahrdlqslekd", postContext : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. cursus dolor et tortor malesuada, nec vehicula dolor hendrerit. Vivamus interdum nisl ut dolor placerat, viverra porttitor metus commodo. Cras molestie dui nec lacinia luctus. Suspendisse potenti. Quisque sit amet dui vitae ipsum vesti bulums.")
            PostCreate(postName: "wpahrdlqslekd", postContext : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. cursus dolor et tortor malesuada, nec vehicula dolor hendrerit. Vivamus interdum nisl ut dolor placerat, viverra porttitor metus commodo. Cras molestie dui nec lacinia luctus. Suspendisse potenti. Quisque sit amet dui vitae ipsum vesti bulums.")
                .previewDevice("iPhone 8")
        }
    }
}
//

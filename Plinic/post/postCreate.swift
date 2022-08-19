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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
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
                .frame(width: 390, height: 44)
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
                            .padding([.leading, .top], 15)
                    }// placeholder
                    
                } // TextEditor
                .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                .cornerRadius(10)
                .frame(width: 390, height: 400)
                Text("공개된 플레이리스트")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .frame(width: 390, height: 25, alignment: .leading)
                    .font(.system(size: 20))
                
                Rectangle()
                    .foregroundColor(Color(red: 0.108, green: 0.109, blue: 0.119))
                    .frame(width: 390, height: 2)
                    .padding(.bottom, 5)
                
                
                ScrollView(.horizontal) {
                    HStack{
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                        
                        VStack{
                            Thumbnail(thumbnail: "defaultImg")
                                .frame(height: 190)
                            Text("비오는 날 듣기 좋은 노래")
                                .foregroundColor(Color.white)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .frame(width: 170, height: 15)
                        }
                        .padding(.trailing, 10)
                    } // 공개된 플레이리스트 정보
                } // 스크롤뷰
                
                
            } // VStack
            
            
        } // ZStack
        
    }
}

struct PostCreate_Previews: PreviewProvider {
    static var previews: some View {
        PostCreate(postName: "wpahrdlqslekd", postContext : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. cursus dolor et tortor malesuada, nec vehicula dolor hendrerit. Vivamus interdum nisl ut dolor placerat, viverra porttitor metus commodo. Cras molestie dui nec lacinia luctus. Suspendisse potenti. Quisque sit amet dui vitae ipsum vesti bulums.")
    }
}
//

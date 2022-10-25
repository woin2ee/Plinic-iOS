//
//  searchResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/07.
//

import SwiftUI

struct SearchResultView: View {
    
    let data = Array(1...3)
    
    var body: some View {
        ZStack  {
            Color.black
                .ignoresSafeArea()
            VStack() {
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("유저")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: userDetail()){
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.blue)
                            }
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                            .padding(.trailing, 15)
                        }//HStack
                        
                        Rectangle()
                                 .fill(Color.white)
                                 .frame(minWidth: 200, maxHeight: 2)
                                 .padding(.top, 10)
                                 .padding(.leading, 10)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(minWidth: 300, maxHeight: 20, alignment: .leading)
                            .padding([.top, .leading], 10)
                        NavigationLink(destination: UserContentView()) {
                            HStack(alignment: .bottom){
                                userTopResult(profileImg: "random1", nickName: "Hi", infoCount: 12)
                                userResult(profileImg: "random1", nickName: "ddddd")
                                    .padding(.leading, 10)
                            }//HStack
                            .padding()
                            .padding(.top, 10)
                        }
                    }//VStack
                    .padding(.leading, 10)
                }//HStack
                
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("게시글")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: postContentView()){
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.blue)
                            }
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                            .padding(.trailing, 15)
                        }//HStack
                        Rectangle()
                                 .fill(Color.white)
                                 .frame(minWidth: 200, maxHeight: 2)
                                 .padding(.top, 10)
                                 .padding(.leading, 10)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(minWidth: 300, maxHeight: 20, alignment: .leading)
                            .padding([.top, .leading], 10)
                        ScrollView(.horizontal) {
                            HStack(spacing:15) {
                                ForEach(data, id: \.self) {i in
                                    VStack() {
                                        ThumbnailView(thumbnail: "defaultImg")
                                        Text("\(i)")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                    }//VStack
                                } //ForEach
                            }//HSTack
                        }
                        .frame(maxHeight: 200, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    }//VStack
                    .padding(.leading, 10)
                }//HStack
                .padding(.top, 15)
            }//VStack
        }//ZStack
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}
   



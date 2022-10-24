//
//  PostHeader.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/20.
//

import SwiftUI


struct PostHeaderView: View {
    
    // MARK: - 통신으로 받아오는 데이터
    @StateObject var noticeAPI: NoticeAPI = NoticeAPI()
    @State var recentNotice: RecentNotice = RecentNotice.creatEmpty()
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "megaphone.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color.MainColor)
                    .frame(width: 42, height: 42)
                    .padding(.leading, 2)
                
                NavigationLink(destination: WebView(requestURL: "https://plinic.netlify.app/notices/\(recentNotice.noticeID)")){
                    Text("\(recentNotice.noticeTitle)")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.all, 5)
                        .frame(maxWidth: 300, maxHeight: 32)
                        .background(Color.BackgroundSubColor)
                        .foregroundColor(Color.gray)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: PostCreate(postName: "", postContext : "")){
                    Image(systemName: "plus.circle")
                        .font(.system(size: 35))
                        .foregroundColor(Color(red: 0.503, green: 0.928, blue: 0.601))
                        .frame(width: 42, height: 42)
                }
                .padding(.trailing, 5)
            } // 상단바 구현
            .frame(maxWidth: 390, maxHeight: 46)
            .foregroundColor(Color.MainColor)
            .padding(.top, 2)
        }
        .onAppear(){
            noticeAPI.getRecentNotice() { result in
                switch result {
                case .success(let notice):
                    self.recentNotice = notice
                    print(recentNotice)
                case .failure(let failure):
                    _ = failure
                }
            }
        }
        
    }
}

struct PostHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostHeaderView()
        }
    }
}

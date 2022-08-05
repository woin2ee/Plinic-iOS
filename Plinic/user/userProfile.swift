//
//  userProfile.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/05.
//

import SwiftUI

struct UserProfile: View {
    
    @State var name: String = ""
    var profile : String
//    var Genre = ["red", "green", "blue"]
//    @State var selectedGenre = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                
                Image(profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                
                Text("프로필 사진 변경")
                    .frame(width: 102, height: 22)
                    .foregroundColor(Color(red: 0.501, green: 0.93, blue: 0.601))
                    .font(.system(size: 15))
                    .padding(.bottom, 50)
                
                TextField("Enter your name", text: $name)
                    .frame(width: 350, height: 44)
                    .background(Color(red: 0.108, green: 0.109, blue: 0.119))
                
//                VStack {
//                      Picker("Choose a color", selection: $selectedGenre) {
//                        ForEach(Genre, id: \.self) {
//                          Text($0)
//                        }
//                      }
//                      .pickerStyle(.wheel)
//                      .background(Color(red: 0.108, green: 0.109, blue: 0.119))
//                      .cornerRadius(15)
//                      .padding()
//
//
//                      Text("You selected: \(selectedGenre)")
//                    }
                
            } // VStack
        } // ZStack
    }
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(profile: "random1")
    }
}


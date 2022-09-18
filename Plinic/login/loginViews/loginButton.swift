//
//  loginButton.swift
//  Plinic
//
//  Created by MacBook Air on 2022/09/18.
//

import Foundation
import SwiftUI

struct LoginButton : View {
    
    
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmInput: String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View{
        
        
        
        VStack{
            Form {
                Section(header: Text("이름")) {
                    TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
                }
                .listRowBackground(Color.white.opacity(0.7))
                Section(header: Text("이메일")) {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                }
                .listRowBackground(Color.white.opacity(0.7))
                Section(header: Text("비밀번호")) {
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                    SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
                }
                .listRowBackground(Color.white.opacity(0.7))
                Section{
                    Button {
                        print("회원가입 버튼 클릭")
                    } label: {
                        Text("회원가입하기")
                    }
                }
                .listRowBackground(Color.white.opacity(0.7))
            }
        }// VStack
    }
    
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

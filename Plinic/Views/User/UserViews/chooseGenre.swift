//
//  chooseGenre.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/08.
//

import SwiftUI

struct ChooseGenre: View {
    
    var genre = ["red", "green", "blue", "s"]
    @State private var genre1 = 0
    @State private var genre2 = 0
    @State private var genre3 = 0
    
    @State private var selectedItem: Int = 0
    
    var body: some View {
        VStack {
            Text("Content")
            // 1
            Picker("Color", selection: $selectedItem) {
                Text("Red").tag(0)
                Text("Blue").tag(1)
                Text("Green").tag(2)
            }
        }
        .padding()
//        .toolbar {
//            ToolbarItem {
//                // 2
//                Picker("Color", selection: $selectedItem) {
//                    Text("Red").tag(0)
//                    Text("Blue").tag(1)
//                    Text("Green").tag(2)
//                }
//            }
//        }
    }
}

struct ChooseGenre_Previews: PreviewProvider {
    static var previews: some View {
        ChooseGenre()
    }
}

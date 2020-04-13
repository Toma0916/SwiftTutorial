//
//  ContentView.swift
//  HelloWorld
//
//  Created by 鈴木透馬 on 2020/04/13.
//  Copyright © 2020 Toma. All rights reserved.
//

import SwiftUI

struct ContentView: View {  // Viewプロトコルを採用
    @State var labelText = "Hello, SwiftUI!"  // propertyを監視
    var body: some View {
        VStack(spacing: 80) {
            Text(labelText)
                .font(.largeTitle)
                .foregroundColor(Color.red)
            Button(action: {self.labelText = "Yes Tapped!"}) {
                Text(/*@START_MENU_TOKEN@*/"Tap!!"/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .frame(width: 80, height: 20)
                    .border(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

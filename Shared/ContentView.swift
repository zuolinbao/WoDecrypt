//
//  ContentView.swift
//  Shared
//
//  Created by zuo on 2020/12/24.
//

import SwiftUI
import EMEncrypt

struct ContentView: View {
    @State private var upText = ""
    @State private var key = "123456789012345678901234"
    @State private var iv = "01234567"
    @State private var downText = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Text("3DES").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("密文").frame(width: 100)
                VStack {
                    TextEditor(text: $upText)
                }.padding(.all, 5).background(Color.white).frame(height:200).cornerRadius(8)
            }
            
            Spacer().frame( height: 10)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    downText = JKEncrypt.shared().decEncrypt(upText)
                }) {
                    Text("解密")
                    Image(systemName: "chevron.down.circle")
                }
                
                Spacer()
                
                Button(action: {
                    upText = JKEncrypt.shared().encrypt(downText)
                }) {
                    Text("加密")
                    Image(systemName: "chevron.up.circle")
                }
                
                Spacer()
            }.padding(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            Spacer().frame( height: 10)
            
            HStack {
                Text("明文").frame(width: 100)
                VStack {
                    TextEditor(text: $downText)
                }.padding(.all, 5).background(Color.white).frame(height:200).cornerRadius(8)
            }

            
        }.padding(EdgeInsets.init(top: 30, leading: 0, bottom: 30, trailing: 20))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by zuo on 2020/12/24.
//

import SwiftUI
import CryptoSwift

struct ContentView: View {
    @State private var upText = ""
    @State private var key = ""
    @State private var iv = "wNSOYIB1k1DjY5lA"
    @State private var downText = ""
    
    var body: some View {
        let key16 = String(key.prefix(16))
        
        VStack(alignment: .center) {
            
            Text("AES128").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("偏移量(iv)").frame(width: 100)
                TextField("", text: $iv).cornerRadius(8)
            }
            
            Spacer()
            
            HStack {
                Text("密钥(key)").frame(width: 100)
                VStack {
                    TextEditor(text: $key)
                }.padding(.all, 5).background(Color.white).frame(height:40).cornerRadius(8)
                
            }
            
            Spacer()
            
            HStack {
                Text("密文").frame(width: 100)
                VStack {
                    TextEditor(text: $upText)
                }.padding(.all, 5).background(Color.white).frame(height:80).cornerRadius(8)
            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    do {
                        let aes = try AES(key: key16, iv: iv)
                        let decrypted2 = try upText.decryptBase64ToString(cipher: aes)
                        downText = decrypted2
                    } catch { }
                }) {
                    Text("解密")
                    Image(systemName: "chevron.down.circle")
                }
                
                Spacer()
                
                Button(action: {
                    do {
                        let aes = try AES(key: key16, iv: iv)
                        let encrypted = try aes.encrypt(downText.bytes)
                        let encryptedBase64 = encrypted.toBase64()

                        upText = encryptedBase64!
                    } catch { }
                }) {
                    Text("加密")
                    Image(systemName: "chevron.up.circle")
                }
                
                Spacer()
            }.padding(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            HStack {
                Text("明文").frame(width: 100)
                VStack {
                    TextEditor(text: $downText)
                }.padding(.all, 5).background(Color.white).frame(height:80).cornerRadius(8)
            }
            
            
            Spacer()

            
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

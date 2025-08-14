//
//  SectionCreateKeytool.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section08CreateKeytool: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    @State private var isKeyExistError = false
    @State private var isComplete = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "08.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Создание Keytool для GooglePlay")
                    .font(.title)
                
                Text("Работа в терминале. Удостоверится что выбрана папка \(appName)")
                
                Text("Вводим команду для генерации нового ключа:")
                CopyTextView(text: "sudo keytool -genkey -v -keystore \(appName.lowercased()).keystore -alias \(appName.lowercased()) -keyalg RSA -keysize 2048 -validity 10000")
                Text("Вводим пароли и всю необходимую информацию")
                
                
                Button("Переместить файл"){
                    isComplete = true
                    let fileManager = FileManager.default
                    let filePath = "/Users/\(NSUserName())/\(appName)/\(appName.lowercased()).keystore"

                    if fileManager.fileExists(atPath: filePath) {
                        do {
                            try FileManager.default.moveItem(atPath: "/Users/\(NSUserName())/\(appName)/\(appName.lowercased()).keystore", toPath: "/Users/\(NSUserName())/\(appName)/android/app/\(appName.lowercased()).keystore")
                        }catch {
                            print("Error moving icon: \(error)")
                        }
                    }else {
                        isKeyExistError = true
                    }
                }
                .alert("Файл ключей не существует", isPresented: $isKeyExistError) {
                    Button("Закрыть", role: .cancel) {}
                }
                
                if isComplete {
                    DefaultButtonView(title: "Готово") {
                        sections.append(index+1)
                    }
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}

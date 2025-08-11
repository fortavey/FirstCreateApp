//
//  Section15AddWebview.swift
//  MainCRM
//
//  Created by Main on 19.03.2025.
//

import SwiftUI

struct Section15AddWebview: View {
    @Binding var sections: [Int]
    @Binding var webviewDomain: String
    var index: Int
    var appName: String
    @State private var random: Int = Int.random(in: 1..<21)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "15.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Добавление Webview")
                    .font(.title)
                
                Text("Переименовать файл App.tsx(App.jsx) в App1.js")
                Text("Так же внутри этого файла изменить название функции App на App1")
                    .padding(.bottom, 10)
                HStack{
                    Text("Создать новый файл App.tsx и вставить в него заготовленный код")
                    CopyTextView(
                        text: AppJSCode(
                            domain: "https://domenforplay\(random).website",
                            appName: "\(appName.lowercased())"
                        )
                        .getAppJsCode())
                }
                HStack{
                    Text("Проверьте внутри файла App.tsx поле 'url' должно быть: ")
                    CopyTextView(text: "https://domenforplay\(random).website")
                }
                HStack{
                    Text("Проверьте внутри файла App.tsx поле 'appName' должно быть:: ")
                    CopyTextView(text: "\(appName.lowercased())")
                }
                    .padding(.bottom, 10)
                
                
                Text("Запустить приложение, проверить работоспособность")
                
                DefaultButtonView(title: "Готово") {
                    webviewDomain = "https://domenforplay\(random).website"
                    sections.append(index+1)
                }
                
               
            }
            Spacer()
        }
        .sectionModifiers()
    }
}

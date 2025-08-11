//
//  CreateAppSection01View.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct Section01CreateAppView: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "01.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Создание приложения")
                .font(.title)
            HStack {
                Text("Открываем терминал. Удостоверится что выбрана корневая папка")
                CopyTextView(text: "cd ~")
                Spacer()
            }
            Text("Вводим команду создания нового приложения:")
            CopyTextView(text: "npx @react-native-community/cli@latest init \(appName)")
            Text("Дожидаемся окончания процесса")
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}


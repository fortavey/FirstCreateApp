//
//  Section03TerminalError.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section03TerminalError: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "03.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Если терминал выдал ошибку")
                .font(.title)
            HStack {
                Text("Вводим команду для открытия папки проекта")
                CopyTextView(text: "open .")
                Spacer()
            }
            Text("В открывшемся окне удаляем папку 'node_modules'")
            HStack {
                Text("Переустанавливаем зависимости проекта")
                CopyTextView(text: "npm i")
                Spacer()
            }
            Text("Еще раз вводим команду запуска приложения:")
            CopyTextView(text: "npx react-native start")
            Text("Дожидаемся окончания процесса")
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
            
        }
        .sectionModifiers()
    }
}

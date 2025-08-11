//
//  Section02FirstStart.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section02FirstStart: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "02.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Первый запуск приложения")
                .font(.title)
            HStack {
                Text("Работа в терминале. Переходим в папку только что созданного приложения")
                CopyTextView(text: "cd \(appName)")
                Spacer()
            }
            Text("Вводим команду запуска приложения:")
            CopyTextView(text: "npx react-native start")
            Text("Дожидаемся окончания процесса")
            HStack {
                DefaultButtonView(title: "Все норм") {
                    sections.append(4)
                }
                DefaultButtonView(title: "Ошибка") {
                    sections.append(index+1)
                }
                
                Spacer()
            }
            
        }
        .sectionModifiers()
    }
}

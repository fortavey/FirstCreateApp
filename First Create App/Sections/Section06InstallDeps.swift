//
//  Section06InstallDeps.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section06InstallDeps: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "06.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Устанавливаем зависимости")
                    .font(.title)
                Text("Работа в терминале. Удостоверится что выбрана папка \(appName)")
                Text("Вводим команду для установки зависимостей приложения:")
                CopyTextView(text: "npm i @react-navigation/elements @react-navigation/native @react-navigation/native-stack react-native-safe-area-context react-native-screens")
                Text("Дожидаемся окончания процесса")
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            
            Spacer()
        }
        .sectionModifiers()
    }
}

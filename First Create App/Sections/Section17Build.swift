//
//  Section16Build.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section17Build: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "17.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            Text("Собираем билд")
                .font(.title)
            Text("Запускаем команду в терминале:")
            CopyTextView(text: "npx react-native build-android --mode=release")
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}

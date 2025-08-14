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
    @State private var isError: Bool = false
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
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: "/Users/\(NSUserName())/\(appName)/android/app/build/outputs/bundle/release/app-release.aab") {
                    sections.append(index+1)
                }else {
                    isError = true
                }
            }
            .alert("Билд проекта еще не собран", isPresented: $isError) {
                Button("Закрыть", role: .cancel) {}
            }
        }
        .sectionModifiers()
    }
}

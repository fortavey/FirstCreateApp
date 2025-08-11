//
//  Section09CopyFiles.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section09CopyFiles: View {
    @Binding var sections: [Int]
    @State private var isFilesExistError = false
    var appName: String
    var devLink: String
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "09.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Копируем файлы в проект")
                    .font(.title)
                
                Text("Скачайте файлы проекта в папку Documents и распакуйте их")
                    .font(.headline)
                
                if let link = URL(string: devLink) {
                    if devLink.matches("https"){
                        Link(destination: link) {
                            HStack{
                                Text("Скачать")
                                Image("GoogleDriveIcon")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                            }
                        }
                    }
                }
                
                Button("Переместить файлы"){
                    let fileManager = FileManager.default
                    let filePath = "/Users/\(NSUserName())/Documents/\(appName)/App.tsx"

                    if fileManager.fileExists(atPath: filePath) {
                        do {
                            try fileManager.removeItem(atPath: "/Users/\(NSUserName())/\(appName)/App.tsx")
                            try fileManager.moveItem(atPath: "/Users/\(NSUserName())/Documents/\(appName)/src", toPath: "/Users/\(NSUserName())/\(appName)/src")
                            try fileManager.moveItem(atPath: "/Users/\(NSUserName())/Documents/\(appName)/App.tsx", toPath: "/Users/\(NSUserName())/\(appName)/App.tsx")
                            try fileManager.moveItem(atPath: "/Users/\(NSUserName())/Documents/\(appName)/App1.tsx", toPath: "/Users/\(NSUserName())/\(appName)/App1.tsx")
                        }catch {
                            print("Error moving icon: \(error)")
                        }
                    }else {
                        isFilesExistError = true
                    }
                }
                .alert("Файл проекта отсутствуют либо не распакованы", isPresented: $isFilesExistError) {
                    Button("Закрыть", role: .cancel) {}
                }
                                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}

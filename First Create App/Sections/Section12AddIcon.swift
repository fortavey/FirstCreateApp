//
//  Section12AddIcon.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI
import Cocoa

struct Section12AddIcon: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "12.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Добавляем иконку в приложение")
                    .font(.title)
                
                Text("В Android Studio нажать правой кнопкой на папку app/res в левом столбце")
                
                Text("В контекстном меню выбрать New - Image Assets")
                
                Button("Открыть папку с иконкой") {
                    print("/Users/\(NSUserName())/\(appName)/src/\(appName.lowercased())_assets")
                    let fileManager = FileManager.default
                    
                    do {
                        var dirName = ""
                        var res = try fileManager.contentsOfDirectory(atPath: "/Users/\(NSUserName())/\(appName)/src")
                        res.forEach{
                            if $0.contains("assets") {
                                dirName = $0
                                openFinder(at: "/Users/\(NSUserName())/\(appName)/src/\(dirName)")
                            }
                        }
                    }catch {
                        print("Error moving icon: \(error)")
                    }
                }
                
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
    
    func openFinder(at path: String) {
        let url = URL(fileURLWithPath: path)
        NSWorkspace.shared.open(url)
    }
}

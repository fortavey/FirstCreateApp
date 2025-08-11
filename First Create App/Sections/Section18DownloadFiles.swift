//
//  Section17DownloadFiles.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI

struct Section18DownloadFiles: View {
    var app: BlankAppModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "18.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            Text("Загрузка готовых файлов")
                .font(.title)
            Text("Откройте Google Диск и загрузите указанные файлы и папки:")
            Text(" - app-release.aab")
            Text(" - \(app.name.lowercased()).keystore")
            Text(" - скриншоты")
            Text(" - иконка 512х512")
            
            if let link = URL(string: app.driveLink) {
                Link(destination: link) {
                    HStack{
                        Text("Открыть Google Диск")
                        Image("GoogleDriveIcon")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
            }
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}

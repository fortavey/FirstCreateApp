//
//  Section15EndSettings.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section16EndSettings: View {
    var appName: String
    @Binding var sections: [Int]
    @State private var isHandleSettings = false
    var index: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "16.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Завершение настройки")
                    .font(.title)
                
                GradleProperties(appName: appName)
                
                BuildGradleApp(appName: appName)
                
                Button("Ручная настройка"){
                    isHandleSettings.toggle()
                }
                
                if isHandleSettings {
                    Text("Редактируем файл android/gradle.properties")
                    Text("Добавляем эти строки во 2-ю строчку файла")
                    
                    CopyTextView(text:
"""
MYAPP_UPLOAD_STORE_FILE=\(appName.lowercased()).keystore
MYAPP_UPLOAD_KEY_ALIAS=\(appName.lowercased())
MYAPP_UPLOAD_STORE_PASSWORD=12345678
MYAPP_UPLOAD_KEY_PASSWORD=12345678
"""
                    )
                    
                    Text("Редактируем файл android/app/build.gradle")
                    
                    Text("Добавляем эти строки в файл")
                    
                    CopyTextView(text:
"""
release {
    if (project.hasProperty('MYAPP_UPLOAD_STORE_FILE')) {
        storeFile file(MYAPP_UPLOAD_STORE_FILE)
        storePassword MYAPP_UPLOAD_STORE_PASSWORD
        keyAlias MYAPP_UPLOAD_KEY_ALIAS
        keyPassword MYAPP_UPLOAD_KEY_PASSWORD
    }
}
"""
                    )
                    
                    Text("Строку")
                    
                    CopyTextView(text: "signingConfig signingConfigs.debug")
                    
                    Text("Меняем на")
                    
                    CopyTextView(text: "signingConfig signingConfigs.release")
                }
                
                
                                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            .sectionModifiers()
            
        }
    }
}

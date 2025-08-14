//
//  Section17DownloadFiles.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI
import Cocoa

struct Section18DownloadFiles: View {
    var app: BlankAppModel
    @Binding var sections: [Int]
    @State private var isError: Bool = false
    @State private var errorMessage: String = "Какая то ошибка!"
    var index: Int
    let fileManager = FileManager.default
    
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
            
            Button("Собрать файлы") {
                createFilesDir()
            }
            .alert(errorMessage, isPresented: $isError) {
                Button("Закрыть", role: .cancel) {}
            }
            
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
    
    func createFilesDir() {
        let isCreateDriveDir = createDriveDir()
        if !isCreateDriveDir {
            renderErrorMessage(err: "Не удалось создать папку GoogleDrive. Возможно она уже существует")
            return
        }
        let isCreateScreensDir = createScreensDir()
        if !isCreateScreensDir {
            renderErrorMessage(err: "Не удалось создать папку Screens")
            return
        }
        let isMoveScreens = moveScreens()
        if !isMoveScreens {
            renderErrorMessage(err: "Не удалось скопировать скриншоты")
            return
        }
        let copyReleaseAAB = copyReleaseAAB()
        if !copyReleaseAAB {
            renderErrorMessage(err: "Не удалось скопировать файл app-release.aab")
            return
        }
        let copyKeystore = copyKeystore()
        if !copyKeystore {
            renderErrorMessage(err: "Не удалось скопировать файл .keystore")
            return
        }
        let copyLogo = copyLogo()
        if !copyLogo {
            renderErrorMessage(err: "Не удалось скопировать иконку")
            return
        }
        
        openFinder(at: "/Users/\(NSUserName())/\(app.name)/GoogleDrive")
    }
    
    func renderErrorMessage(err: String) {
        errorMessage = err
        isError = true
    }
    
    func createDriveDir() -> Bool {
        do{
            try fileManager.createDirectory(atPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive", withIntermediateDirectories: false)
            return true
        }catch{
            return false
        }
    }
    
    func createScreensDir() -> Bool {
        do{
            try fileManager.createDirectory(atPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive/Screens", withIntermediateDirectories: false)
            return true
        }catch{
            return false
        }
    }
    
    func moveScreens() -> Bool {
        do {
            var screens = try fileManager.contentsOfDirectory(atPath: "/Users/\(NSUserName())/Screenshots")
            try screens.forEach{screen in
                try fileManager.moveItem(atPath: "/Users/\(NSUserName())/Screenshots/\(screen)", toPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive/Screens/\(screen)")
            }
            return true
        }catch {
            return false
        }
    }
    
    func copyReleaseAAB() -> Bool {
        do {
            try fileManager.copyItem(
                atPath: "/Users/\(NSUserName())/\(app.name)/android/app/build/outputs/bundle/release/app-release.aab",
                toPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive/app-release.aab")
            return true
        }catch {
            return false
        }
    }
    
    func copyKeystore() -> Bool {
        do {
            try fileManager.copyItem(
                atPath: "/Users/\(NSUserName())/\(app.name)/android/app/\(app.name.lowercased()).keystore",
                toPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive/\(app.name.lowercased()).keystore")
            return true
        }catch {
            return false
        }
    }
    
    func copyLogo() -> Bool {
        do {
            var dirName = ""
            var fileName = ""
            var res = try fileManager.contentsOfDirectory(atPath: "/Users/\(NSUserName())/\(app.name)/src")
            res.forEach{
                if $0.contains("assets") {
                    dirName = $0
                }
            }
            var images = try fileManager.contentsOfDirectory(atPath: "/Users/\(NSUserName())/\(app.name)/src/\(dirName)")
            images.forEach{
                if $0.contains("_logo") {
                    fileName = $0
                }
            }
            
            try fileManager.copyItem(
                atPath: "/Users/\(NSUserName())/\(app.name)/src/\(dirName)/\(fileName)",
                toPath: "/Users/\(NSUserName())/\(app.name)/GoogleDrive/\(fileName)")
            
            return true
        }catch {
            return false
        }
    }
    
    func openFinder(at path: String) {
        let url = URL(fileURLWithPath: path)
        NSWorkspace.shared.open(url)
    }
}

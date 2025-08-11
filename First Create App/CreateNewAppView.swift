//
//  CreateNewAppView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct CreateNewAppView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var sections: [Int] = [1]
    @State private var webviewDomain: String = ""
    var app: BlankAppModel
    @State private var saved = false
    
    var body: some View {
        VStack {
            Text("Создание нового приложения - \(app.name)")
            List {
                
                if sections.contains(1) {Section01CreateAppView(appName: app.name, sections: $sections, index: 1)}
                if sections.contains(2) {Section02FirstStart(appName: app.name, sections: $sections, index: 2)}
                if sections.contains(3) {Section03TerminalError(appName: app.name, sections: $sections, index: 3)}
                if sections.contains(4) {Section04StartInAndroidStudio(appName: app.name, sections: $sections, index: 4)}
                if sections.contains(5) {SectionStopProcess(appName: app.name, sections: $sections, index: 5)}
                if sections.contains(6) {Section06InstallDeps(appName: app.name, sections: $sections, index: 6)}
                if sections.contains(7) {Section07NavigationSettings(appName: app.name, sections: $sections, index: 7)}
                if sections.contains(8) {Section08CreateKeytool(appName: app.name, sections: $sections, index: 8)}
                if sections.contains(9) {Section09CopyFiles(sections: $sections, appName: app.name, devLink: app.devLink, index: 9)}
                if sections.contains(10) {SectionStartProcess(appName: app.name, sections: $sections, index: 10)}
                if sections.contains(11) {SectionStopProcess(appName: app.name, sections: $sections, index: 11)}
                if sections.contains(12) {Section12AddIcon(appName: app.name, sections: $sections, index: 12)}
                if sections.contains(13) {SectionStartProcess(appName: app.name, sections: $sections, index: 13)}
                if sections.contains(14) {Section14MakeScreens(appName: app.name, sections: $sections, index: 14)}
                if sections.contains(15) {Section16EndSettings(appName: app.name, sections: $sections, index: 15)}
                if sections.contains(16) {Section17Build(appName: app.name, sections: $sections, index: 16)}
                if sections.contains(17) {Section18DownloadFiles(app: app, sections: $sections, index: 17)}
                if sections.contains(18) {
                    VStack{
                        Text("Завершение создания приложения")
                            .font(.title)
                        if app.driveLink != "" {
                            HStack{
                                Button {
                                    saved.toggle()
                                    addNewApp()
                                } label: {
                                    Text("Сохранить")
                                }
                                .frame(height: 50)
                                .padding()
                                .padding(.bottom, 30)
                                .disabled(saved)
                                
                                Button {
                                    removeBlankApp()
                                } label: {
                                    Text("Закрыть")
                                }
                                .frame(height: 50)
                                .padding()
                                .padding(.bottom, 30)
                                .disabled(!saved)
                            }
                        }else {
                            Text("Вставьте ссылку загруженного архива")
                                .font(.title2)
                                .padding()
                                .padding(.bottom, 30)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
    
    private func addNewApp(){
        Firestore.firestore()
            .collection("apps")
            .document()
            .setData([
                "devComp": MainConfig.comp,
                "firstAppName": app.name,
                "devLink": app.devLink,
                "driveLink": app.driveLink,
                "webviewDomain": webviewDomain
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
//                    appListVM.getAppsList()
                }else{
                    print("ERR")
                }
            }
    }
    
    private func removeBlankApp(){
        FirebaseServices().removeDocument(id: app.id, collection: "newapps") { res in
            if res {
                print("UPDATE LIST")
//                delegate.updateList()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

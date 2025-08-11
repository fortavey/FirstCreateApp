//
//  MainViewModel.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import SwiftUI
import Combine

struct BlankAppModel: Identifiable {
    var id: String
    var name: String
    var devLink: String
    var webviewDomain: String
    var driveLink: String
    var isDone: Bool
}

@Observable class MainViewModel {
    var appsList: [BlankAppModel] = []
    
    func getAppsList(){
        FirebaseServices().getDocuments(collection: "newapps") { docs in
            var array: [BlankAppModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let name = doc["name"] as? String
                let devLink = doc["devLink"] as? String
                let webviewDomain = doc["webviewDomain"] as? String
                let driveLink = doc["driveLink"] as? String
                let isDone = doc["isDone"] as? Bool
                array.append(
                    BlankAppModel(
                        id: id,
                        name: name ?? "",
                        devLink: devLink ?? "",
                        webviewDomain: webviewDomain ?? "",
                        driveLink: driveLink ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.appsList = array
        }
    }
}

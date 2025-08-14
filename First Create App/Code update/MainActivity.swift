//
//  MainActivity.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import SwiftUI

struct MainActivity: View {
    var appName: String
    var fileManager: FileManager = .default
    @State private var showAlert: Bool = false
    @State private var success: Bool = false
    @Binding var isComplete: Bool
    
    var body: some View {
        if success {
            Image(systemName: "checkmark.circle")
                .foregroundStyle(.green)
                .padding()
        }else {
            Button("MainActivity.kt"){
                start()
                isComplete = true
            }
            .alert("Ошибка изменения файла", isPresented: $showAlert) {
                Button("Закрыть", role: .cancel) {}
            }
        }
    }
    
    func start(){
        let filePath = "/Users/\(NSUserName())/\(appName)/android/app/src/main/java/com/\(appName.lowercased())/MainActivity.kt"

        if fileManager.fileExists(atPath: filePath) {
            
            do {
                let fileURL = URL(fileURLWithPath: filePath)
                let fileData = try Data(contentsOf: fileURL)
                if let fileContents = String(data: fileData, encoding: .utf8) {
                    if fileContents.contains("import android.os.Bundle;") {
                        success = true
                        return
                    }
                    let stringToReplace = "class MainActivity : ReactActivity() {"
                    let replacementString = """
import android.os.Bundle;

class MainActivity : ReactActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(null)
    }
"""
                    let replacedString = fileContents.replacingOccurrences(of: stringToReplace, with: replacementString)
                    do {
                        try replacedString.write(to: fileURL, atomically: true, encoding: .utf8)
                        success = true
                    } catch {
                        print("replacedString")
                        showAlert = true
                    }
                }
            }catch {
                print("do catch")
                showAlert = true
            }
        } else {
            print("/Users/\(NSUserName())/\(appName)/android/app/src/main/java/com/\(appName.lowercased())/MainActivity.kt")
            showAlert = true
        }
    }
}


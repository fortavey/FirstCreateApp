//
//  ContentView.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var mainVM = MainViewModel()
    
    var body: some View {
        NavigationStack {
            HStack{
                Text("Cоздание приложений")
                    .font(.title3)
                    .padding()
                Button("Сформировать список"){
                    mainVM.getAppsList()
                }
                Spacer()
            }
            List(mainVM.appsList){ app in
                HStack{
                    LineItemView(text: app.name, width: 150)
                    LineItemView(text: app.devLink, width: 150)
                    LineItemView(text: app.driveLink, width: 150)
                    NavigationLink {
                        CreateNewAppView(app: app)
                    } label: {
                        Label {
                            Text("Начать")
                        } icon: {
                            Image(systemName: "arrow.right.square")
                        }
                    }
                }
            }
        }
    }
}

//
//  Section13MakeScreens.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section14MakeScreens: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "14.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Сохраняем скриншоты")
                    .font(.title)
                
                Text("В Android Studio делаем скриншоты и сохраняем их для гарузки в GooglePlay")
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}

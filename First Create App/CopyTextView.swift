//
//  CopyTextView.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import SwiftUI

struct CopyTextView: View {
    var text: String
    @State var isText = true
    
    var body: some View {
        Button {
            copyText()
            isText = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isText = true
            }
        } label: {
            ZStack {
                if isText {
                    Text(text)
                        .foregroundStyle(.white)
                }else {
                    Image(systemName: "doc.on.doc")
                }
            }
            .padding(.top, 5)
            .padding(.bottom, 5)
            .padding(.horizontal)
            .background(.black)
            
        }

    }
    
    func copyText(){
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(text, forType: .string)
    }
}

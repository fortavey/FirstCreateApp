//
//  DefaultButtonView.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import SwiftUI

struct DefaultButtonView: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

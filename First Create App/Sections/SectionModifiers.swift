//
//  SectionModifiers.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import Foundation
import SwiftUICore

struct SectionModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(.sectionBG)
    }
}

extension View {
    func sectionModifiers() -> some View {
        modifier(SectionModifiers())
    }
}

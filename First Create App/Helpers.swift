//
//  Helpers.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import Foundation
import SwiftUI

struct Helpers {
    func getSectionImageName(number: Int) -> String {
        if number < 10 {
            return "0\(number).square"
        }
        return "\(number).square"
    }
}

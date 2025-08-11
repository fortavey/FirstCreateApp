//
//  String+matches.swift
//  First Create App
//
//  Created by Main on 04.08.2025.
//

import Foundation

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

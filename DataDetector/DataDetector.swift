//
//  DataDetector.swift
//  NSDataDetector
//
//  Created by Vinicius Uzeda on 07/12/2021.
//

import Foundation

class DataDetector {
    static func matches(string: String, patterns: NSTextCheckingResult.CheckingType) throws -> [String] {
        try NSDataDetector(types: patterns.rawValue)
            .matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
            .map {
                String(string[Range($0.range, in: string)!])
            }
    }
}

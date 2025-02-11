//
//  Extension.swift
//  WWSimpleDeepSeek
//
//  Created by William.Weng on 2025/2/11.
//

import UIKit
 
// MARK: - Data (function)
extension Data {
        
    /// Data => JSON
    /// - 7b2268747470223a2022626f6479227d => {"http": "body"}
    /// - Returns: Any?
    func _jsonObject(options: JSONSerialization.ReadingOptions = .allowFragments) -> Any? {
        let json = try? JSONSerialization.jsonObject(with: self, options: options)
        return json
    }
}

//
//  Int+Extensions.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import Foundation

extension Int {
    
    func toBondFormat() -> String {
        "\(String(format: "%02d", self))"
    }
}

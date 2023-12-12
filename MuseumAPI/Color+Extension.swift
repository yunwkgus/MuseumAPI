//
//  Color+Extension.swift
//  MuseumAPI
//
//  Created by jose Yun on 12/11/23.
//

import Foundation
import SwiftUI

extension SwiftUI.Color {
    init(hexString: String, opacity: Double = 1.0) {
        var hexString = hexString
        hexString.removeFirst()
        let hex: Int = Int(hexString, radix: 16)!
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

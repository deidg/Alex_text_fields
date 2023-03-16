//
//  InputLimitManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import UIKit

final class InputLimitManager {
    func isMaxLimit(in string: String) -> Bool {
        var inputTextCount = string.count
        if inputTextCount <= 10 {
            return true
        } else {
            return false
        }
    }
}

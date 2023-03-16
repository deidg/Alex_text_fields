//
//  NoDigitsManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 14.03.2023.
//

import Foundation

final class NoDigitsManager {
    func isNoDigit(in string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }
}

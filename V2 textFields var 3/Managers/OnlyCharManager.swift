//
//  OnlyCharManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import JMMaskTextField_Swift

final class OnlyCharManager {
    
 

    func isCharOnly(in string: String) -> Bool {
        var inputText = string //JMMaskTextField(frame:CGRect.zero)
        let placeHolderText = onlyCharTFSetup.onlyCharTFMaskString

        if inputText == placeHolderText {
            return true
        } else {
            return false
        }
    }
}

//MARK: constants
extension OnlyCharManager {
        enum onlyCharTFSetup {
            static let onlyCharTFMaskString = "AAAAA-00000"
            static let onlyCharTFPlaceHolder = "wwwww-ddddd"
        }

    }

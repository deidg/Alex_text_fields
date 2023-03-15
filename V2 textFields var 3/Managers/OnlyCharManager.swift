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
//    enum Constants {
//        enum Constraints {
//            static let topConstraint = 4
//            static let topToViewConstraint = 7
//            static let trailingConstraint = 16
//            static let leadingConstraint = 8
//            static let labelHeightConstraint = 20
//            static let viewHeightConstraint = 36
//            static let textfieldHeightConstraint = 22
//        }
//        enum LabelsSettings {
//            static let lettersTextViewCornerRadius: CGFloat = 10
//        }
//        enum LabelsFonts {
//            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
//        }
        enum onlyCharTFSetup {
            static let onlyCharTFMaskString = "AAAAA-00000"
            static let onlyCharTFPlaceHolder = "wwwww-ddddd"
        }
//        enum LabelsTexts {
//            static let onlyCharectersLabelText = "Only characters"
//            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
//        }
//        enum TextFields {
//            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
//        }
    }

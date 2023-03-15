//
//  InputLimitManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import UIKit

final class InputLimitManager {
    
//    init(<#parameters#>) {
//        var charactersCounter: UILabel
//        var currentText: String
//        
//    }
//    
    
    func isMaxLimit(currentText: String, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        let lengthToAdd = updatedText.count
        charactersCounter.text = "\(lengthToAdd)/10"
        if lengthToAdd <= 10 {
            charactersCounter.textColor = .black
        } else {
            charactersCounter.textColor = .red
            charactersCounter.text = "10/10"
        }
        return lengthToAdd <= 10
    }
}


//
//  LinkManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import UIKit

final class LinkManager {
    func isBrowserStarted(in string: String) -> Bool {
        
        let url = URL(string: string)
        let result: Bool
        
        result = UIApplication.shared.open(url)
        if result == true {
            return true
        } else {
            return false
        }
    }
}







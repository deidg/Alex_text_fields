//
//  LinkManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import UIKit

final class LinkManager {
    //    func isLinkValid(in string: String) -> Bool {
    func isBrowserStarted(in string: String) -> Bool {
        
        //    func isBrowserStarted(_ sender: Any) {
        
        //        if textField == linkTextField {
        //            let link = linkTextField.text ?? ""
        //            func isLinkValid(_ link : String) -> Bool {
        //                let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
        //                return linkTest.evaluate(with: link)
        //            }
        //            if isLinkValid(link) {
        //                let delay : Double = 2.0
        //                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        
        //                    func startBrowser(_ sender: Any) {
        
//        if let urlString = string //self.linkTextField.text {
            let urlString = string //self.linkTextField.text {
            let url: URL?
        
            if urlString.hasPrefix("http://") {
                url = URL(string: urlString)
            } else if urlString.hasPrefix("https://") {
                url = URL(string: urlString)
            } else {
                url = URL(string: "http://" + urlString)
            }
            if let url = url {
//                self.openURL(url: url)
                UIApplication.shared.open(url)
            }
//        }
//    }
//    startBrowser(self.linkTextField)
//}
return true
}
//            } else {
//                print("NOT valid link")
//            }
//        }
//        return true
}

//    }
//}

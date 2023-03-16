//
//  LinkManager.swift
//  V2 textFields var 3
//
//  Created by Alex on 15.03.2023.
//

import Foundation
import UIKit

final class LinkManager {
    private let linkRegex: String = "((?:http|https)://)?(?:www\\.)?(?:Www\\.)?(?:WWW\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
    func isLinkValid(_ link : String) -> Bool {
        let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
        return linkTest.evaluate(with: link)
    }
}

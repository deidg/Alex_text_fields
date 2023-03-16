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
        let url = URL(string: string)!
        
        UIApplication.shared.open(url) 

        return true
    }
}
    
    
    
    
    
    
    //            let url: URL?
    
    //            if urlString.hasPrefix("http://") {
    //                url = URL(string: urlString)
    //            } else if urlString.hasPrefix("https://") {
    //                url = URL(string: urlString)
    //            } else {
    //                url = URL(string: "http://" + urlString)
    //            }
    //            let url = urlString
    //        if url {
    //                self.openURL(url: url)
    //        if UIApplication.shared.open(urlString) {
    //            return true
    //            } else {
    //                return false
    //    }
    //        }
    //    }
    //    startBrowser(self.linkTextField)
    //}
    //return true
    //}
    ////            } else {
    ////                print("NOT valid link")
    ////            }
    ////        }
    ////        return true
    //}
    
    //    }
    //}
    //}


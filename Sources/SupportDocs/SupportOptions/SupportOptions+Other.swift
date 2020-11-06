//
//  SupportOptions+Other.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Options for the progress bar color
     */
    struct Other {
        
        /**
         The style of the activity indicator, shown when the JSON is being downloaded
         */
        var activityIndicatorStyle: UIActivityIndicatorView.Style = .medium
        
        /**
         A custom `View` you can add to the bottom of the list
         */
        var footer: AnyView? = nil
    }
}

extension UIActivityIndicatorView.Style {
    func getString() -> String {
        switch self {
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        default:
            return "Unknown Style"
        }
    }
}

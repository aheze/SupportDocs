//
//  SupportOptions+Other.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Set the loading spinner size and an optional footer, displayed at the bottom of the `List`.
     */
    struct Other {
        
        /**
         Set the loading spinner size and an optional footer, displayed at the bottom of the `List`.
         
         - parameter activityIndicatorStyle: The style of the activity indicator, shown when the JSON is being downloaded.
         - parameter footer: A custom `View` that you can add to the bottom of the list.
         */
        public init(
            activityIndicatorStyle: UIActivityIndicatorView.Style = .medium,
            footer: AnyView? = nil
        ) {
            self.activityIndicatorStyle = activityIndicatorStyle
            self.footer = footer
        }
        
        /**
         The style of the activity indicator, shown when the JSON is being downloaded.
         */
        public var activityIndicatorStyle: UIActivityIndicatorView.Style = .medium
        
        /**
         A custom `View` that you can add to the bottom of the list.
         */
        public var footer: AnyView? = nil
    }
}

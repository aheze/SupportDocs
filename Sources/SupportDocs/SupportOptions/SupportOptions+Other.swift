//
//  SupportOptions+Other.swift
//  SupportDocs
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
     */
    struct Other {
        
        /**
         Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
         
         - parameter activityIndicatorStyle: The style of the activity indicator, shown when the JSON is being downloaded.
         - parameter welcomeView: A custom `View` that will be presented at first, if you're in landscape mode with `doubleColumnNavigationViewStyle`  -- when you don't have any row selected in the list yet.
         - parameter footer: A custom `View` that you can add to the bottom of the list.
         */
        public init(
            activityIndicatorStyle: UIActivityIndicatorView.Style = .medium,
            welcomeView: AnyView? = nil,
            footer: AnyView? = nil
        ) {
            self.activityIndicatorStyle = activityIndicatorStyle
            self.welcomeView = welcomeView
            self.footer = footer
        }
        
        /**
         The style of the activity indicator, shown when the JSON is being downloaded.
         */
        public var activityIndicatorStyle: UIActivityIndicatorView.Style = .medium
        
        /**
         A custom `View` that will be presented at first, if you're in landscape mode with `doubleColumnNavigationViewStyle`  -- when you don't have any row selected in the list yet.
         */
        public var welcomeView: AnyView? = nil
        
        /**
         A custom `View` that you can add to the bottom of the list.
         */
        public var footer: AnyView? = nil
    }
}

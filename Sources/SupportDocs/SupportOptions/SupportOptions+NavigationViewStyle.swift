//
//  SupportOptions+NavigationViewStyle.swift
//  SupportDocs
//
//  Created by Zheng on 11/7/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Enum wrapper for `ListStyle`.
     */
    enum CustomNavigationViewStyle {
        
        /**
         Translates into [DefaultNavigationViewStyle](https://developer.apple.com/documentation/swiftui/defaultnavigationviewstyle).
         */
        case defaultNavigationViewStyle
        
        /**
         Translates into [DoubleColumnNavigationViewStyle](https://developer.apple.com/documentation/swiftui/doublecolumnnavigationviewstyle).
         */
        case doubleColumnNavigationViewStyle
        
        /**
         Translates into [StackNavigationViewStyle](https://developer.apple.com/documentation/swiftui/stacknavigationviewstyle).
         */
        case stackNavigationViewStyle
        
    }
}

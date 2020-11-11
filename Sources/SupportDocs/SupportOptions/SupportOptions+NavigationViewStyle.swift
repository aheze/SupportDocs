//
//  SupportOptions+NavigationViewStyle.swift
//  SupportDocs
//
//  Created by Zheng on 11/7/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Enum wrapper for `NavigationViewStyle`.
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

/**
 Custom extension to apply a `NavigationViewStyle`.
 
 SupportDocs uses a custom enum (`SupportOptions.CustomNavigationViewStyle`) that wraps SwiftUI's `NavigationViewStyle`. This is because `NavigationViewStyle` conforms to a generic, which makes it hard to store as a property inside `SupportOptions`.
 */
internal extension NavigationView {
    @ViewBuilder
    func navigationViewStyle(for customNavigationViewStyle: SupportOptions.CustomNavigationViewStyle) -> some View {
        switch customNavigationViewStyle {
        case .defaultNavigationViewStyle:
            navigationViewStyle(DefaultNavigationViewStyle())
        case .doubleColumnNavigationViewStyle:
            navigationViewStyle(DoubleColumnNavigationViewStyle())
        case .stackNavigationViewStyle:
            navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

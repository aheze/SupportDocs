//
//  SupportOptions+ListStyle.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 11/1/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Enum wrapper for `ListStyle`.
     */
    enum CustomListStyle {
        
        /**
         Translates into [DefaultListStyle](https://developer.apple.com/documentation/swiftui/defaultliststyle).
         */
        case defaultListStyle
        
        /**
         Translates into [PlainListStyle](https://developer.apple.com/documentation/swiftui/plainliststyle).
         */
        case plainListStyle
        
        /**
         Translates into [GroupedListStyle](https://developer.apple.com/documentation/swiftui/groupedliststyle).
         */
        case groupedListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`.
         
          Translates into [InsetGroupedListStyle](https://developer.apple.com/documentation/swiftui/insetgroupedliststyle).
         */
        case insetGroupedListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`.
         
          Translates into [InsetListStyle](https://developer.apple.com/documentation/swiftui/insetliststyle).
         */
        case insetListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`.
         
          Translates into [SidebarListStyle](https://developer.apple.com/documentation/swiftui/sidebarliststyle).
         */
        case sidebarListStyle
    }
}


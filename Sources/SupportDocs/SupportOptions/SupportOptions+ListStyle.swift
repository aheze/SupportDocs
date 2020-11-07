//
//  SupportOptions+ListStyle.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 11/1/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Enum wrapper for `ListStyle`
     */
    enum CustomListStyle {
        
        case defaultListStyle
        
        case plainListStyle
        
        case groupedListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`
         */
        case insetGroupedListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`
         */
        case insetListStyle
        
        /**
          **iOS 14.0 and above only.** Otherwise, defaults to `defaultListStyle`
         */
        case sidebarListStyle
    }
}


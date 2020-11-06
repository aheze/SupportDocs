//
//  SupportOptions+ListStyle.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 11/1/20.
//

import SwiftUI

extension SupportOptions {
    
    /**
     Enum wrapper for `ListStyle`
     */
    enum CustomListStyle {
        case defaultListStyle
        case plainListStyle
        case groupedListStyle
        case insetGroupedListStyle
        case insetListStyle
        case sidebarListStyle
        
        func getString() -> String {
            switch self {
            case .defaultListStyle:
                return "DefaultListStyle"
            case .plainListStyle:
                return "PlainListStyle"
            case .groupedListStyle:
                return "GroupedListStyle"
            case .insetGroupedListStyle:
                return "InsetGroupedListStyle"
            case .insetListStyle:
                return "InsetListStyle"
            case .sidebarListStyle:
                return "SidebarListStyle"
            }
        }
    }
}


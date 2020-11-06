//
//  SupportDocsView+Lists.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/13/20.
//

import SwiftUI

/**
 Each section in the List
 */
struct SupportSection: Identifiable {
    let id = UUID() /// Required for the List
    
    var name: String
    var color: UIColor
    var supportItems: [SupportItem]
}

/**
 Each item in a section in the List
 */
struct SupportItem: Identifiable {
    let id = UUID() /// Required for the List
    
    var title: String
    var url: String
}

/**
 The `View` that displays the title of each document, used in the List
 
 Think of this as the `Cell` class for `cellForItemAt` if this was UIKit
 */
struct SupportItemRow: View {
    
    /**
     Title of the document
     */
    var title: String
    
    /**
     Color of the title
     */
    var titleColor: UIColor
    
    /**
     The URL to load when this `View` is tapped
     */
    var url: URL
    
    /**
     Options for how to display the progress bar (foreground + background color)
     */
    var progressBarOptions: SupportOptions.ProgressBar
    
    var body: some View {
        NavigationLink(
            destination:
                
                /**
                 Push to the web view when tapped
                 */
                WebViewContainer(url: url, progressBarOptions: progressBarOptions)
                .navigationBarTitle(Text(title), displayMode: .inline)
        ) {
            Text(title)
            .foregroundColor(Color(titleColor))
        }
    }
}

/**
 Custom extension to apply a `ListStyle`
 
 SupportDocs uses a custom enum (`SupportOptions.CustomListStyle`) that wraps SwiftUI's `ListStyle`. This is because `ListStyle` conforms to a generic, which makes it hard to store as a property inside `SupportOptions`.
 */
extension List {
    @ViewBuilder
    func listStyle(for customListStyle: SupportOptions.CustomListStyle) -> some View {
        switch customListStyle {
        case .defaultListStyle:
            listStyle(DefaultListStyle())
        case .plainListStyle:
            listStyle(PlainListStyle())
        case .groupedListStyle:
            listStyle(GroupedListStyle())
        case .insetGroupedListStyle:
            if #available(iOS 14.0, *) {
                listStyle(InsetGroupedListStyle())
            } else {
                listStyle(DefaultListStyle())
            }
        case .insetListStyle:
            if #available(iOS 14.0, *) {
                listStyle(InsetListStyle())
            } else {
                listStyle(DefaultListStyle())
            }
        case .sidebarListStyle:
            if #available(iOS 14.0, *) {
                listStyle(SidebarListStyle())
            } else {
                listStyle(DefaultListStyle())
            }
        }
    }
}

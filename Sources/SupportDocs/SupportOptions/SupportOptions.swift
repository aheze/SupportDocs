//
//  SupportOptions.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/24/20.
//

import SwiftUI

/**
 Options for configuring SupportDocs.
 
 # Parameters
 - `urls`: Contains the `URL` of the data source JSON and a custom 404 error page.
 - `categories`: Allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
 - `navigationBar`: Customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
 - `progressBar`: Customize the `foregroundColor` and `backgroundColor` of the progress bar.
 - `listStyle`: The style of the `List`. Defaults to `.defaultListStyle`.
 - `other`: Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
 */
public struct SupportOptions {
    
    /**
     Contains the `URL` of the data source JSON and a custom 404 error page.
     */
    public var urls: URLs = URLs()
    
    /**
     Allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
     */
    public var categories: [Category]? = nil
    
    /**
     Customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
     */
    public var navigationBar: NavigationBar = NavigationBar()
    
    /**
     Customize the `foregroundColor` and `backgroundColor` of the progress bar.
     */
    public var progressBar: ProgressBar = ProgressBar()
    
    /**
     The style of the `List`. Defaults to `.defaultListStyle`.
     */
    public var listStyle: CustomListStyle = CustomListStyle.insetGroupedListStyle
    
    /**
     Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
     */
    public var other: Other = Other()
    
    /**
     Options for configuring SupportDocs.
     
     - parameter urls: Contains the `URL` of the data source JSON and a custom 404 error page.
     - parameter categories: Allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
     - parameter navigationBar: Customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
     - parameter progressBar: Customize the `foregroundColor` and `backgroundColor` of the progress bar.
     - parameter listStyle: The style of the `List`. Defaults to `.defaultListStyle`.
     - parameter other: Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
     */
    public init(
        urls: URLs = URLs(),
        categories: [Category]? = nil,
        navigationBar: NavigationBar = NavigationBar(),
        progressBar: ProgressBar = ProgressBar(),
        listStyle: CustomListStyle = CustomListStyle.defaultListStyle,
        other: Other = Other()
    ) {
        self.urls = urls
        self.categories = categories
        self.navigationBar = navigationBar
        self.progressBar = progressBar
        self.listStyle = listStyle
        self.other = other
    }
}

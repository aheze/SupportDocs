//
//  SupportOptions.swift
//  SupportDocs
//
//  Created by Zheng on 10/24/20.
//

import SwiftUI

/**
 Options for configuring SupportDocs.
 
 # Parameters
 - `categories`: Allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
 - `navigationBar`: Customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
 - `progressBar`: Customize the `foregroundColor` and `backgroundColor` of the progress bar.
 - `listStyle`: The style of the `List`. Defaults to `.insetGroupedListStyle`.
 - `navigationViewStyle`: The style of the `NavigationView`. Defaults to `.defaultNavigationViewStyle`.
 - `other`: Set the loading spinner size, welcome view, footer to be displayed at the bottom of the `List`, and error 404 page.
 */
public struct SupportOptions {
    
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
     The style of the `List`. Defaults to `.insetGroupedListStyle`.
     */
    public var listStyle: CustomListStyle = CustomListStyle.insetGroupedListStyle
    
    /**
     The style of the `NavigationView`. Defaults to `.defaultNavigationViewStyle`.
     */
    public var navigationViewStyle: CustomNavigationViewStyle = CustomNavigationViewStyle.defaultNavigationViewStyle
    
    /**
     Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
     */
    public var other: Other = Other()
    
    /**
     Options for configuring SupportDocs.
     
     - parameter categories: Allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
     - parameter navigationBar: Customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
     - parameter progressBar: Customize the `foregroundColor` and `backgroundColor` of the progress bar.
     - parameter listStyle: The style of the `List`. Defaults to `.insetGroupedListStyle`.
     - parameter navigationViewStyle: The style of the `NavigationView`. Defaults to `.defaultNavigationViewStyle`.
     - parameter other: Set the loading spinner size, welcome view, and an optional footer to be displayed at the bottom of the `List`.
     */
    public init(
        categories: [Category]? = nil,
        navigationBar: NavigationBar = NavigationBar(),
        progressBar: ProgressBar = ProgressBar(),
        listStyle: CustomListStyle = CustomListStyle.insetGroupedListStyle,
        navigationViewStyle: CustomNavigationViewStyle = CustomNavigationViewStyle.defaultNavigationViewStyle,
        other: Other = Other()
    ) {
        self.categories = categories
        self.navigationBar = navigationBar
        self.progressBar = progressBar
        self.listStyle = listStyle
        self.navigationViewStyle = navigationViewStyle
        self.other = other
    }
}

//
//  SupportOptions.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/24/20.
//

import SwiftUI

/**
 Options for configuring SupportDocs
 
 - `urls` - contains the `URL`s of the data source JSON and a custom 404 error page.
 - `categories` - allows you to group documents with the same `tag` into the same section of the list. Each category may contain more than one `tag`.
 - `navigationBar` - customize the Navigation Bar's `title`, `titleColor`, `dismissButtonTitle`, `buttonTintColor`, and `backgroundColor`.
 - `progressBar` - customize the `foregroundColor` and `backgroundColor` of the progress bar.
 - `listStyle` - the style of the `List`.
 - `other` - set the activity indicator size and a custom footer view.
 */
public struct SupportOptions {
    var urls = URLs()
    var categories: [Category]?
    var navigationBar = NavigationBar()
    var progressBar = ProgressBar()
    var listStyle: CustomListStyle = CustomListStyle.insetGroupedListStyle
    var other: Other = Other()
    
    /**
     Allow instantiating `SupportOptions` in your app
     */
    public init() {}
}

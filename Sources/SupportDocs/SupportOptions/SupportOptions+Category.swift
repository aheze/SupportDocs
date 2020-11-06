//
//  SupportOptions+Category.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/25/20.
//

import UIKit

extension SupportOptions {
    
    /**
     A group of `Documents` to be displayed as a section inside the `List`
     
     Before you create a `Category`, you must be using the `tag` property inside the MarkDown file on GitHub. Assign an array of `Strings` like this:
     ```
     title: "How to add a friend"
     tags:
       - friending
       - generalHelp
     ```
     The GitHub action will automatically parse your `tag`s. Then, in your app, simply make a new `Category` instance and pass it into `options.categories`.
     ```
     let options: SupportOptions = SupportOptions(
         categories: [
             .init(jsonTagNames: ["friending"], displayName: "Friends", displayColor: UIColor.label)
         ]
     )
     ```
     You are allowed to have more than one `tag` for each Markdown file, and each `category` can include more than one tag.
     */
    struct Category {
        
        /**
         Determines which `tag`s this category should include
         
         You may include multiple `tag`s, like so:
         ```
         let options: SupportOptions = SupportOptions(
             categories: [
                 .init(jsonTagNames: ["friending", "help", "betaHelp"], displayName: "Miscellaneous", displayColor: UIColor.label)
             ]
         )
         ```
         Each `category` gets its own section in the `List`.
         */
        var jsonTagNames: [String]
        
        /**
         What to display in the header of the `List`
         */
        var displayName: String
        
        /**
         The color of the row in the `List`
         */
        var displayColor: UIColor
        
    }
    
    
    
    
}

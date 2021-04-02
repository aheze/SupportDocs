//
//  SupportOptions+ProgressBar.swift
//  SupportDocs
//
//  Created by Zheng on 10/25/20.
//

import SwiftUI

public extension SupportOptions {
    /**
     Options for the progress bar color.
     */
    struct ProgressBar {
        /**
         Options for the progress bar color.
         
         - parameter foregroundColor: Color of the moving part of the progress bar.
         - parameter backgroundColor: Color of the progress bar's background.
         */
        public init(
            foregroundColor: Colors = Colors.systemBlue,
            backgroundColor: Colors = Colors.secondarySystemBackground
        ) {
            self.foregroundColor = foregroundColor
            self.backgroundColor = backgroundColor
        }
        
        /**
         Color of the moving part of the progress bar.
         */
        public var foregroundColor = Colors.systemBlue
        
        /**
         Color of the progress bar's background.
         */
        public var backgroundColor = Colors.secondarySystemBackground
    }
}

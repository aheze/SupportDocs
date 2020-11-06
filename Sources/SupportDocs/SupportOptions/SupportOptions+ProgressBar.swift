//
//  SupportOptions+ProgressBar.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/25/20.
//

import SwiftUI

public extension SupportOptions {
    
    /**
     Options for the progress bar color
     */
    struct ProgressBar {
        
        /**
         Color of the moving part of the progress bar
         */
        var foregroundColor: UIColor = UIColor.systemBlue
        
        /**
         Color of the progress bar's background
         */
        var backgroundColor: UIColor = UIColor.secondarySystemBackground
    }
}


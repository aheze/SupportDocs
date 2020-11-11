//
//  SupportOptions+NavigationBar.swift
//  SupportDocs
//
//  Created by Zheng on 10/24/20.
//

import UIKit

public extension SupportOptions {
    
    /**
     Customize the appearance of the Navigation Bar.
     */
    struct NavigationBar {
        
        /**
         Customize the appearance of the Navigation Bar.
         
         - parameter title: The title to show at the top of the screen.
         - parameter titleColor: Color of the title.
         - parameter dismissButtonTitle: The title of the dismiss button. If you leave this as `nil`, no dismiss button will be shown.
         - parameter buttonTintColor: Color of the Back and Dismiss buttons.
         - parameter backgroundColor: Background color of the Navigation Bar.
         */
        public init(
            title: String = "Support",
            titleColor: UIColor = UIColor.label,
            dismissButtonTitle: String? = nil,
            buttonTintColor: UIColor? = nil,
            backgroundColor: UIColor? = nil
        ) {
            self.title = title
            self.titleColor = titleColor
            self.dismissButtonTitle = dismissButtonTitle
            self.buttonTintColor = buttonTintColor
            self.backgroundColor = backgroundColor
        }
        
        /**
         The title to show at the top of the screen.
         */
        public var title: String = "Support"
        
        /**
         Color of the title.
         */
        public var titleColor: UIColor = UIColor.label
        
        /**
         The title of the dismiss button.
         
         If you leave this as `nil`, no dismiss button will be shown.
         
         # Warning
         If you're using SupportDocs in SwiftUI, you must also pass in the `Binding<Bool>` that you use to show the `sheet`. If you don't provide this, no dismiss button will be shown.
         ```
         struct ContentView: View {
             @State var supportDocsPresented = false
             let options: SupportOptions = SupportOptions()
             var body: some View {
                 Button("Present") { self.supportDocsPresented = true }
                 .sheet(isPresented: $supportDocsPresented) {
        
                    /// pass it in here!
                    SupportDocsView(options: options, isPresented: $supportDocsPresented)
                 }
             }
         }
         ```
         */
        public var dismissButtonTitle: String? = nil
        
        /**
         Color of the Back and Dismiss buttons.
         */
        public var buttonTintColor: UIColor? = nil
        
        /**
         Background color of the Navigation Bar.
         */
        public var backgroundColor: UIColor? = nil
        
    }
}

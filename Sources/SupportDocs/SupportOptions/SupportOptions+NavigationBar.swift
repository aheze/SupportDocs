//
//  SupportOptions+NavigationBar.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/24/20.
//

import UIKit

public extension SupportOptions {
    
    /**
     Customize the appearance of the Navigation Bar
     */
    struct NavigationBar {
        
        public init(
            title: String = "Support",
            titleColor: UIColor = UIColor.black,
            dismissButtonTitle: String? = nil,
            buttonTintColor: UIColor? = nil,
            backgroundColor: UIColor? = nil,
            backgroundImage: UIImage? = nil
        ) {
            self.title = title
            self.titleColor = titleColor
            self.dismissButtonTitle = dismissButtonTitle
            self.buttonTintColor = buttonTintColor
            self.backgroundColor = backgroundColor
            self.backgroundImage = backgroundImage
        }
        
        /**
         The title to show at the top of the screen
         */
        public var title: String = "Support"
        
        /**
         Color of the title
         */
        public var titleColor: UIColor = UIColor.black
        
        /**
         The title of the dismiss button
         
         If you leave this as `nil`, no dismiss button will be shown.
         
         # Warning
         If you're using SupportDocs in SwiftUI, you must also pass in the `Binding<Bool>` that you use to show the `sheet`. If you don't provide this, no dismiss button will be shown.
         ```
         struct ContentView: View {
             @State var presentingModal = false /// the `Binding<Bool>` that you use to show the `sheet`
             let options: SupportOptions = SupportOptions(
                 categories: [
                     .init(jsonTagNames: ["settings"], displayName: "Settings", displayColor: UIColor.label)
                 ],
                 navigationBar: .init(
                     title: "Help!",
                     dismissButtonTitle: "Done"
                 ),
                 listStyle: InsetGroupedListStyle()
             )
             var body: some View {
                 Button("Present") { self.presentingModal = true }
                 .sheet(isPresented: $presentingModal) {
         
                     /// you MUST pass in `$presentingModal`!
                     SupportDocs_SwiftUI(options: options, isPresentedBinding: $presentingModal)
                 }
             }
         }
         ```
         */
        public var dismissButtonTitle: String? = nil
        
        /**
         Color of the Back and Dismiss buttons
         */
        public var buttonTintColor: UIColor? = nil
        
        /**
         Background color of the Navigation Bar
         */
        public var backgroundColor: UIColor? = nil
        public var backgroundImage: UIImage? = nil
        
    }
}

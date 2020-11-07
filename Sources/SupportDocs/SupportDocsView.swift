//
//  SupportDocsView.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/12/20.
//

import SwiftUI

public struct SupportDocsView: View {
    
    /**
     Instantiate SupportDocs in your app.
     
     - parameter options: Options used for configuring SupportDocs. `urls.dataSource` is required, everything else is optional (mostly for changing the SupportDocs' appearance).
     - parameter isPresented: The Binding that you use to present SupportDocs in SwiftUI. Required if you want a "Dismiss" button.
     
     If you want to have a "Dismiss" button, you must pass in the same `@State` property as you do the the `.sheet`, like this:
     
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
     This is only for SwiftUI -- You don't need to do this in UIKit. As long as you set `options.navigationBar.dismissButtonTitle = "Dismiss"`, SupportDocs will dismiss itself.
     */
    public init(options: SupportOptions, isPresented: Binding<Bool>? = nil) {
        self.options = options
        self.isPresented = isPresented
    }
    
    /**
     Options used for configuring SupportDocs. `urls.dataSource` is required, everything else is optional (mostly for changing the SupportDocs' appearance).
     */
    public let options: SupportOptions
    
    /**
     The Binding that you use to present SupportDocs in SwiftUI. Required if you want a "Done" button.
     
     Pass in the same `@State` property as you do the the `.sheet`, like this:
     
     ```
     struct ContentView: View {
         @State var presentingModal = false
         let options: SupportOptions = SupportOptions()
         var body: some View {
             Button("Present") { self.presentingModal = true }
             .sheet(isPresented: $presentingModal) {
    
                /// pass it in here!
                SupportDocsView(options: options, isPresented: $presentingModal)
             }
         }
     }
     ```
     # In UIKit:
     You don't need to do this in UIKit. As long as you set `options.navigationBar.dismissButtonTitle = "Dismiss"`, SupportDocs will dismiss itself.
     */
    public var isPresented: Binding<Bool>?
    
    /**
     The dismiss button handler for UIKit. This is automatically passed in by `SupportDocsViewController`, you don't access this property.
     */
    internal var donePressed: (() -> Void)?
    
    /**
     The documents decoded from the JSON.
     */
    @State internal var documents: [JSONSupportDocument] = [JSONSupportDocument]()
    
    /**
     If the JSON is downloading, display the loading spinner.
     */
    @State internal var isDownloadingJSON = true
    
    /**
     The data from the JSON is sorted into this, based on how you configured `options.categories`. The list that displays your documents' titles gets it data from here.
     */
    @State internal var sections: [SupportSection] = [SupportSection]()
    
    public var body: some View {
        NavigationView {
            Group {
                if isDownloadingJSON {
                    
                    /// Show the loading spinner if JSON is downloading.
                    ActivityIndicator(isAnimating: $isDownloadingJSON, style: options.other.activityIndicatorStyle)
                } else {
                    List {
                        
                        /// First, display the titles of your documents.
                        ForEach(sections) { section in
                            Section(header: Text(section.name)) {
                                ForEach(section.supportItems) { item in
                                    SupportItemRow(
                                        title: item.title,
                                        titleColor: section.color,
                                        url: URL(string: item.url) ?? options.urls.error404,
                                        progressBarOptions: options.progressBar
                                    )
                                }
                            }
                            .displayTextAsConfigured() /// Prevent default all-caps behavior if possible (iOS 14 and above).
                        }
                        
                        /// Then, display the footer. Customize this inside `options.other.footer`.
                        options.other.footer
                        .listRowInsets(EdgeInsets())
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color(UIColor.systemGroupedBackground))
                    }
                    .listStyle(for: options.listStyle) /// Set the `listStyle` of your selection.
                }
            }
            .transition(.opacity) /// Fade it in once the JSON loads.
            .navigationBarTitle(Text(options.navigationBar.title), displayMode: .large) /// Set your title.
            .background(NavigationConfigurator { nc in /// Set the other properties of `options.navigationBar`.
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.foregroundColor: options.navigationBar.titleColor]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: options.navigationBar.titleColor]
                
                if let backgroundColor = options.navigationBar.backgroundColor {
                    navBarAppearance.backgroundColor = backgroundColor
                    nc.navigationBar.scrollEdgeAppearance = navBarAppearance
                }
                nc.navigationBar.standardAppearance = navBarAppearance
                
                nc.navigationBar.barTintColor = options.navigationBar.backgroundColor
                nc.navigationBar.tintColor = options.navigationBar.buttonTintColor
            })
            
            /**
             If you have a dismiss button, display it.
             */
            .ifConditional( /// Helper inside `Utilities.swift`.
                options.navigationBar.dismissButtonTitle != nil
                    &&
                (isPresented != nil || donePressed != nil)
            ) { content in
                content.navigationBarItems(
                    trailing:
                        Button(options.navigationBar.dismissButtonTitle ?? "Done") {
                            
                            /**
                             When the dismiss button is pressed, dismiss SupportDocs.
                             */
                            isPresented?.wrappedValue = false /// if presented with SwiftUI, toggle the `Binding` that presented this in a sheet.
                            donePressed?() /// if presented with UIKit, trigger the done handler.
                        }
                )
            }
            
            /**
             Show the welcome view if in landscape or on iPad, when a row hasn't been selected yet.
             */
            options.other.welcomeView
        }
        .navigationViewStyle(for: options.navigationViewStyle) /// Set the `navigationViewStyle` of your selection.
        
        /**
         When everything first loads, load the JSON.
         */
        .onAppear {
            loadData()
        }
    }
}

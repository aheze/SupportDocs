//
//  UIKitExampleController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import UIKit
import SwiftUI
import SupportDocs

class UIKitExampleController: UIViewController {
    
    // MARK: - The SwiftUI way of making `SupportOptions` also works in UIKit... but it's harder.
//    let options = SupportOptions(
//        categories: [
//            .init(tag: "boba", displayName: "Boba is awesome!")
//        ],
//        navigationBar: .init(
//            title: "Support",
//            titleColor: UIColor.white,
//            dismissButtonTitle: "Done",
//            buttonTintColor: UIColor.white,
//            backgroundColor: UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
//        ),
//        searchBar: .init(
//            placeholder: "Type here to search",
//            placeholderColor: UIColor.white.withAlphaComponent(0.75),
//            textColor: UIColor.white,
//            tintColor: UIColor.green,
//            backgroundColor: UIColor.white.withAlphaComponent(0.3),
//            clearButtonMode: .whileEditing
//        ),
//        progressBar: .init(
//            foregroundColor: UIColor.green,
//            backgroundColor: UIColor.systemBackground
//        ),
//        listStyle: .insetGroupedListStyle,
//        navigationViewStyle: .defaultNavigationViewStyle,
//        other: .init(
//            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
//            welcomeView: AnyView(WelcomeView()),
//            footer: AnyView(Footer()),
//            error404: URL(string: "https://aheze.github.io/SupportDocs/404")!
//        )
//    )
    
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        // MARK: - UIKit way to make `SupportOptions`
        var options = SupportOptions()
        options.categories = [SupportOptions.Category(tag: "boba", displayName: "Boba is awesome!")]
        options.navigationBar.title = "Support"
        options.navigationBar.titleColor = UIColor.white
        options.navigationBar.dismissButtonView = AnyView(Text("Done"))
        options.navigationBar.buttonTintColor = UIColor.white
        options.navigationBar.backgroundColor = UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        options.searchBar?.placeholder = "Type here to search"
        options.searchBar?.placeholderColor = UIColor.white.withAlphaComponent(0.75)
        options.searchBar?.textColor = UIColor.white
        options.searchBar?.tintColor = UIColor.green
        options.searchBar?.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        options.searchBar?.clearButtonMode = .whileEditing
        options.progressBar.foregroundColor = UIColor.green
        options.progressBar.backgroundColor = UIColor.systemBackground
        options.listStyle = .insetGroupedListStyle
        options.navigationViewStyle = .defaultNavigationViewStyle
        options.other.activityIndicatorStyle = .large
        options.other.welcomeView = AnyView(WelcomeView())
        options.other.footer = AnyView(Footer())
        options.other.error404 = URL(string: "https://aheze.github.io/SupportDocs/404")!

        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
        
    }
}


/**
 The least code that you need to make `SupportDocs` work.
 */
class UIKitExampleControllerMinimalCode: UIViewController {
    
    /**
     Connect this inside the storyboard.
     
     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

class UIKitExampleControllerWithCategories: UIViewController {
    
    /**
     Connect this inside the storyboard.
     
     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        var options = SupportOptions()
        
        let bobaCategory = SupportOptions.Category(
            tag: "boba",
            displayName: "Display Name Is Boba",
            displayColor: UIColor.blue
        )
        
        let fastFoodCategory = SupportOptions.Category(
            tag: "fastFood",
            displayName: "These aren't really healthy",
            displayColor: UIColor.red
        )
        
        options.categories = [bobaCategory, fastFoodCategory]
        
        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

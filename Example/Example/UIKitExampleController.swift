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
//            .init(tags: ["recipes"], displayName: "Recipes")
//        ],
//        navigationBar: .init(
//            title: "Support",
//            titleColor: UIColor.white,
//            dismissButtonTitle: "Done",
//            buttonTintColor: UIColor.white,
//            backgroundColor: UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
//        ),
//        progressBar: .init(
//            foregroundColor: UIColor.green,
//            backgroundColor: UIColor.systemBackground
//        ),
//        listStyle: .insetGroupedListStyle,
//        other: .init(
//            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
//            welcomeView: AnyView(WelcomeView()),
//            footer: AnyView(Footer()),
//            error404: URL(string: "https://google.com")!
//        )
//    )
    
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        // MARK: - UIKit way to make `SupportOptions`
        var options = SupportOptions()
        options.categories = [SupportOptions.Category(tags: ["recipes"], displayName: "Recipes")]
        options.navigationBar.title = "Support"
        options.navigationBar.titleColor = UIColor.white
        options.navigationBar.dismissButtonTitle = "Done"
        options.navigationBar.buttonTintColor = UIColor.white
        options.navigationBar.backgroundColor = UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        options.progressBar.foregroundColor = UIColor.green
        options.progressBar.backgroundColor = UIColor.systemBackground
        options.listStyle = .groupedListStyle
        options.other.activityIndicatorStyle = .large
        options.other.welcomeView = AnyView(WelcomeView())
        options.other.footer = AnyView(Footer())
        options.other.error404 = URL(string: "https://google.com")!
        
        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
        
    }
}


/**
 The least code that you need to make `SupportDocs` work.
 */
class UIKitExampleController_MinimalCode: UIViewController {
    
    /**
     Connect this inside the storyboard.
     
     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

class UIKitExampleController_WithCategories: UIViewController {
    
    /**
     Connect this inside the storyboard.
     
     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        var options = SupportOptions()
        let bobaCategory = SupportOptions.Category(
            tags: ["boba"],
            displayName: "Display Name Is Boba",
            displayColor: UIColor.blue
        )
        
        options.categories = [bobaCategory]
        
        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

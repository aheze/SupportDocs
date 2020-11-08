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
//        urls: .init(
//            dataSource: URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!,
//            error404: URL(string: "https://google.com")!
//        ),
//        categories: nil,
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
//        listStyle: .groupedListStyle,
//        other: .init(
//            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
//            footer: AnyView(Footer())
//        )
//    )
    
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        // MARK: - UIKit way to make `SupportOptions`
        var options = SupportOptions()
        options.urls.dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        options.urls.error404 = URL(string: "https://google.com")!
        options.categories = nil
        options.navigationBar.title = "Support"
        options.navigationBar.titleColor = UIColor.white
        options.navigationBar.dismissButtonTitle = "Done"
        options.navigationBar.buttonTintColor = UIColor.white
        options.navigationBar.backgroundColor = UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        options.progressBar.foregroundColor = UIColor.green
        options.progressBar.backgroundColor = UIColor.systemBackground
        options.listStyle = .groupedListStyle
        options.other.activityIndicatorStyle = .large
        options.other.footer = AnyView(Footer())
        
        let supportDocsViewController = SupportDocsViewController(options: options)
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
        
        var options = SupportOptions()
        options.urls.dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
        let supportDocsViewController = SupportDocsViewController(options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

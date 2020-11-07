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
    
    
    // MARK: - For UIKit, this is one way of making `SupportOptions`
    let options = SupportOptions(
        urls: .init(
            dataSource: URL(string: "https://raw.githubusercontent.com/aheze/SupportDocsSwiftUI/main/SupportDocsSwiftUI/docData.json")!,
            error404: URL(string: "https://google.com")!
        ),
        categories: nil,
        navigationBar: .init(
            title: "Support",
            titleColor: UIColor.white,
            dismissButtonTitle: "Done",
            buttonTintColor: UIColor.white,
            backgroundColor: UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        ),
        progressBar: .init(
            foregroundColor: UIColor.green,
            backgroundColor: UIColor.systemBackground
        ),
        listStyle: .groupedListStyle,
        other: .init(
            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
            footer: AnyView(Footer())
        )
    )
    
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        // MARK: - You can also make `SupportOptions` like this (Only UIKit):
//        var options = SupportOptions()
//        options.urls.dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocsSwiftUI/main/SupportDocsSwiftUI/docData.json")!
//        options.urls.error404 = URL(string: "https://google.com")!
//        options.progressBar.foregroundColor = UIColor.green
//        options.listStyle = .groupedListStyle
        
        let supportDocsViewController = SupportDocsViewController(options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
        
    }
}

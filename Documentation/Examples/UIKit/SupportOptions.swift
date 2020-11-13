//
//  SupportOptions.swift
//  SupportDocsExamplesUIKit
//
//  Created by H. Kamran on 11/11/20.
//

import UIKit
import SwiftUI
import SupportDocs

class SupportOptionsExample: UIViewController {
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        // MARK: - UIKit way to make `SupportOptions`
        var options = SupportOptions()
        options.categories = [SupportOptions.Category(tags: ["boba"], displayName: "Boba is awesome!")]
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

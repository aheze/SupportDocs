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
    
    /// Connect this inside the storyboard
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
        options.other.welcomeView = AnyView(WelcomeView()) /// find this inside https://github.com/aheze/SupportDocs/blob/main/Example/Example/WelcomeView.swift
        options.other.footer = AnyView(Footer()) /// find this inside https://github.com/aheze/SupportDocs/blob/main/Example/Example/Footer.swift
        options.other.error404 = URL(string: "https://aheze.github.io/SupportDocs/404")!

        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

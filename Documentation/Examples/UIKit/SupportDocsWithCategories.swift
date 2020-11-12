//
//  SupportDocsWithCategories.swift
//  SupportDocsExamplesUIKit
//
//  Created by H. Kamran on 11/11/20.
//

import UIKit
import SwiftUI
import SupportDocs

class SupportDocsWithCategories: UIViewController {
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
        let fastFoodCategory = SupportOptions.Category(
            tags: ["fastFood"],
            displayName: "These aren't really healthy",
            displayColor: UIColor.red
        )

        options.categories = [bobaCategory, fastFoodCategory]

        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}

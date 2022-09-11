//
//  MinimalSupportDocs.swift
//  SupportDocsExamplesUIKit
//
//  Created by H. Kamran on 11/11/20.
//

import SupportDocs
import UIKit

class MinimalSupportDocs: UIViewController {
    /**
     Connect this inside the storyboard.

     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_: Any) {
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource)
        present(supportDocsViewController, animated: true, completion: nil)
    }
}

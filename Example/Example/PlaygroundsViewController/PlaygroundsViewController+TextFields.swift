//
//  PlaygroundsViewController+TextFields.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit
import SwiftUI
import SupportDocs

extension PlaygroundsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return true }
        
        switch textField {
        case dataSourceTextField:
            if updatedString.isEmpty {
                dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocsTestingTemplate3/DataSource/_data/supportdocs_datasource.json")!
            } else {
                if let url = URL(string: updatedString) {
                    dataSource = url
                }
            }
        case searchPlaceholderTextField:
            if updatedString.isEmpty {
                options.searchBar?.placeholder = "Search"
            } else {
                options.searchBar?.placeholder = updatedString
            }
        case error404TextField:
            if updatedString.isEmpty {
                options.other.error404 = URL(string: "https://aheze.github.io/SupportDocs/404")!
            } else {
                if let url = URL(string: updatedString) {
                    options.other.error404 = url
                }
            }
        case titleTextField:
            if updatedString.isEmpty {
                options.navigationBar.title = "Support"
            } else {
                options.navigationBar.title = updatedString
            }
        case dismissButtonTitleTextField:
            if updatedString.isEmpty {
                options.navigationBar.dismissButtonView = AnyView(Text("Done"))
            } else {
                options.navigationBar.dismissButtonView = AnyView(Text(updatedString)) 
            }
        default:
            print("unknown textfield")
        }
        
        return true
    }
}


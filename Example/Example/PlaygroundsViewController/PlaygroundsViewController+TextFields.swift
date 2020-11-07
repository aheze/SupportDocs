//
//  PlaygroundsViewController+TextFields.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit
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
            if let url = URL(string: updatedString) {
                options.urls.dataSource = url
            }
        case error404TextField:
            if let url = URL(string: updatedString) {
                options.urls.error404 = url
            }
        case titleTextField:
            options.navigationBar.title = updatedString
        case dismissButtonTitleTextField:
            options.navigationBar.dismissButtonTitle = updatedString
        default:
            print("unknown textfield")
        }
        
        return true
    }
    
}


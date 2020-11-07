//
//  PlaygroundsViewController+Setup.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit
import SwiftUI
import SupportDocs

extension PlaygroundsViewController {
    func setupCornerRadius() {
        urlsView.clipsToBounds = true
        categoriesView.clipsToBounds = true
        navigationBarView.clipsToBounds = true
        progressBarView.clipsToBounds = true
        listStyleView.clipsToBounds = true
        otherView.clipsToBounds = true
        
        urlsView.layer.cornerRadius = 12
        categoriesView.layer.cornerRadius = 12
        navigationBarView.layer.cornerRadius = 12
        progressBarView.layer.cornerRadius = 12
        listStyleView.layer.cornerRadius = 12
        otherView.layer.cornerRadius = 12
        
        titleColorButton.layer.cornerRadius = 8
        buttonTintColorButton.layer.cornerRadius = 8
        navigationBackgroundColorButton.layer.cornerRadius = 8
        foregroundColorButton.layer.cornerRadius = 8
        backgroundColorButton.layer.cornerRadius = 8
        listStyleButton.layer.cornerRadius = 8
        activityIndicatorStyleButton.layer.cornerRadius = 8
        
        addShadow(button: titleColorButton)
        addShadow(button: buttonTintColorButton)
        addShadow(button: navigationBackgroundColorButton)
        addShadow(button: foregroundColorButton)
        addShadow(button: backgroundColorButton)
        
        presentButton.layer.cornerRadius = presentButton.frame.height / 2
    }
    
    func setupTextFieldDelegates() {
        dataSourceTextField.delegate = self
        error404TextField.delegate = self
        titleTextField.delegate = self
        dismissButtonTitleTextField.delegate = self
    }
    
    func setupPickerDelegates() {
        
        listStylePicker.delegate = self
        listStyleButton.inputView = listStylePicker
        
        let listStyleToolbar = UIToolbar()
        listStyleToolbar.sizeToFit()
        
        let listFlexibleButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let listDoneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPicker))
        
        listStyleToolbar.setItems([listFlexibleButton, listDoneButton], animated: true)
        listStyleToolbar.isUserInteractionEnabled = true
        
        listStyleButton.inputAccessoryView = listStyleToolbar
        
        
        activityIndicatorStylePicker.delegate = self
        activityIndicatorStyleButton.inputView = activityIndicatorStylePicker
        
        let activityIndicatorStyleToolbar = UIToolbar()
        activityIndicatorStyleToolbar.sizeToFit()
        
        let activityIndicatorFlexibleButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let activityIndicatorDoneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPicker))
        
        activityIndicatorStyleToolbar.setItems([activityIndicatorFlexibleButton, activityIndicatorDoneButton], animated: true)
        activityIndicatorStyleToolbar.isUserInteractionEnabled = true
        
        activityIndicatorStyleButton.inputAccessoryView = activityIndicatorStyleToolbar
        
    }
    
    func setupDefaultValues() {
        
        // MARK: - Define defaults
        let defaultDataSourceURL = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/dataSource.json")!
        let defaultError404URL = URL(string: "https://google.com")!
        
        let defaultNavigationBarTitle = "Support"
        let defaultNavigationBarTitleColor = UIColor.label
        let defaultNavigationBarDismissButtonTitle = "Done"
        let defaultNavigationBarButtonTintColor = UIColor.blue
        let defaultNavigationBarBackgroundColor: UIColor? = nil
        
        let defaultProgressBarForegroundColor = UIColor.blue
        let defaultProgressBarBackgroundColor = UIColor.secondarySystemBackground
        
        let defaultListStyle = SupportOptions.CustomListStyle.insetGroupedListStyle
        
        let defaultActivityIndicatorStyle = UIActivityIndicatorView.Style.large
        let defaultFooter = Footer()
        
        // MARK: - Set options
        options.urls.dataSource = defaultDataSourceURL
        options.urls.error404 = defaultError404URL
        
        options.categories = nil
        
        options.navigationBar.title = defaultNavigationBarTitle
        options.navigationBar.titleColor = defaultNavigationBarTitleColor
        options.navigationBar.dismissButtonTitle = defaultNavigationBarDismissButtonTitle
        options.navigationBar.buttonTintColor = defaultNavigationBarButtonTintColor
        options.navigationBar.backgroundColor = defaultNavigationBarBackgroundColor
        
        options.progressBar.foregroundColor = defaultProgressBarForegroundColor
        options.progressBar.backgroundColor = defaultProgressBarBackgroundColor
        
        options.listStyle = defaultListStyle
        
        options.other.activityIndicatorStyle = defaultActivityIndicatorStyle
        options.other.footer = AnyView(defaultFooter) /// set the footer
        
        // MARK: - Set UI
        dataSourceTextField.placeholder = defaultDataSourceURL.absoluteString
        error404TextField.placeholder = defaultError404URL.absoluteString
        
        titleTextField.placeholder = defaultNavigationBarTitle
        titleColorButton.backgroundColor = defaultNavigationBarTitleColor
        dismissButtonTitleTextField.placeholder = defaultNavigationBarDismissButtonTitle
        buttonTintColorButton.backgroundColor = defaultNavigationBarButtonTintColor
        navigationBackgroundColorButton.backgroundColor = UIColor.systemBackground
        navigationBackgroundColorButton.setTitle("Nil", for: .normal)
        
        foregroundColorButton.backgroundColor = defaultProgressBarForegroundColor
        backgroundColorButton.backgroundColor = defaultProgressBarBackgroundColor
        
        listStyleButton.setTitle(defaultListStyle.getString(), for: .normal)
        activityIndicatorStyleButton.setTitle(defaultActivityIndicatorStyle.getString(), for: .normal)
        
    }
    
    func addShadow(button: UIButton) {
        button.layer.shadowColor = UIColor.secondaryLabel.cgColor
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.layer.cornerRadius).cgPath
        button.layer.shadowOffset = CGSize(width: 0.25, height: 1)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 2.0
    }
}

extension SupportOptions.CustomListStyle {
    func getString() -> String {
        switch self {
        case .defaultListStyle:
            return "DefaultListStyle"
        case .plainListStyle:
            return "PlainListStyle"
        case .groupedListStyle:
            return "GroupedListStyle"
        case .insetGroupedListStyle:
            return "InsetGroupedListStyle"
        case .insetListStyle:
            return "InsetListStyle"
        case .sidebarListStyle:
            return "SidebarListStyle"
        }
    }
}
extension UIActivityIndicatorView.Style {
    func getString() -> String {
        switch self {
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        default:
            return "Unknown Style"
        }
    }
}

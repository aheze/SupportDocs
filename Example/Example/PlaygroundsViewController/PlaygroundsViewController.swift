//
//  PlaygroundsViewController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import UIKit
import SwiftUI
import SupportDocs

class PlaygroundsViewController: UIViewController {
    
    
    var dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
    var options = SupportOptions()
    
    // MARK: - URLs
    @IBOutlet weak var dataSourceView: UIView!
    @IBOutlet weak var dataSourceTextField: UITextField!
    
    
    // MARK: - Categories
    @IBOutlet weak var categoriesView: UIView!
    
    // MARK: - Navigation Bar
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleColorButton: UIButton!
    @IBOutlet weak var dismissButtonTitleTextField: UITextField!
    @IBOutlet weak var buttonTintColorButton: UIButton!
    @IBOutlet weak var navigationBackgroundColorButton: UIButton!
    
    @IBAction func titleColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.navigationBar.titleColor = color
        }
    }
    @IBAction func buttonTintColorPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender, withNil: true, colorIsNil: options.navigationBar.buttonTintColor == nil) { [weak self] (color) in
            if color == nil {
                sender.backgroundColor = UIColor.systemBackground
                sender.setTitle("Nil", for: .normal)
            } else {
                sender.backgroundColor = color
                sender.setTitle("", for: .normal)
            }
            self?.options.navigationBar.buttonTintColor = color
        }
    }
    @IBAction func navigationBackgroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender, withNil: true, colorIsNil: options.navigationBar.backgroundColor == nil) { [weak self] (color) in
            if color == nil {
                sender.backgroundColor = UIColor.systemBackground
                sender.setTitle("Nil", for: .normal)
            } else {
                sender.backgroundColor = color
                sender.setTitle("", for: .normal)
            }
            self?.options.navigationBar.backgroundColor = color
        }
    }
    
    // MARK: - Search Bar
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchPlaceholderTextField: UITextField!
    @IBOutlet weak var searchPlaceholderColorButton: UIButton!
    @IBOutlet weak var searchTextColorButton: UIButton!
    @IBOutlet weak var searchTintColorButton: UIButton!
    @IBOutlet weak var searchBackgroundColorButton: UIButton!
    
    @IBAction func searchPlaceholderColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.placeholderColor = color
        }
    }
    @IBAction func searchTextColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.textColor = color
        }
    }
    @IBAction func searchTintColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.tintColor = color
        }
    }
    @IBAction func searchBackgroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.backgroundColor = color
        }
    }
    
    let clearButtonModePicker = UIPickerView()
    let clearButtonModeOptions: [UITextField.ViewMode] = [.whileEditing, .unlessEditing, .always, .never]
    
    @IBOutlet weak var clearButtonModeButton: InputViewButton!
    @IBAction func clearButtonModePressed(_ sender: InputViewButton) {
        let currentClearButtonMode = options.searchBar?.clearButtonMode
        
        if let mode = currentClearButtonMode, let firstIndex = clearButtonModeOptions.firstIndex(of: mode) {
            clearButtonModePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }
        
        clearButtonModeButton.becomeFirstResponder()
    }
    
    // MARK: - Progress Bar
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var foregroundColorButton: UIButton!
    @IBOutlet weak var backgroundColorButton: UIButton!
    
    @IBAction func foregroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            sender.backgroundColor = color
            guard let color = color else { return }
            self?.options.progressBar.foregroundColor = color
        }
    }
    @IBAction func backgroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] (color) in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.progressBar.backgroundColor = color
        }
    }
    
    // MARK: - List Style
    @IBOutlet weak var listStyleView: UIView!
    let listStylePicker = UIPickerView()
    let listStyleOptions: [SupportOptions.CustomListStyle] = [.defaultListStyle, .plainListStyle, .groupedListStyle, .insetGroupedListStyle, .insetListStyle, .sidebarListStyle]
    
    @IBOutlet weak var listStyleButton: InputViewButton!
    @IBAction func listStyleButtonPressed(_ sender: InputViewButton) {
        let currentListStyle = options.listStyle
        
        if let firstIndex = listStyleOptions.firstIndex(of: currentListStyle) {
            listStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }
        
        listStyleButton.becomeFirstResponder()
    }
    
    // MARK: - Navigation View Style
    @IBOutlet weak var navigationViewStyleView: UIView!
    let navigationViewStylePicker = UIPickerView()
    let navigationViewStyleOptions: [SupportOptions.CustomNavigationViewStyle] = [.defaultNavigationViewStyle, .doubleColumnNavigationViewStyle, .stackNavigationViewStyle]
    
    @IBOutlet weak var navigationViewStyleButton: InputViewButton!
    @IBAction func navigationViewStyleButtonPressed(_ sender: InputViewButton) {
        let currentNavigationViewStyle = options.navigationViewStyle
        
        if let firstIndex = navigationViewStyleOptions.firstIndex(of: currentNavigationViewStyle) {
            navigationViewStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }
        
        navigationViewStyleButton.becomeFirstResponder()
    }
    
    // MARK: - Other
    @IBOutlet weak var otherView: UIView!
    let activityIndicatorStylePicker = UIPickerView()
    let activityIndicatorStyleOptions: [UIActivityIndicatorView.Style] = [.medium, .large]
    
    @IBOutlet weak var activityIndicatorStyleButton: InputViewButton!
    @IBAction func activityIndicatorStyleButtonPressed(_ sender: InputViewButton) {
        let currentActivityIndicatorStyle = options.other.activityIndicatorStyle
        
        if let firstIndex = activityIndicatorStyleOptions.firstIndex(of: currentActivityIndicatorStyle) {
            activityIndicatorStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }
        
        activityIndicatorStyleButton.becomeFirstResponder()
    }
    
    @IBOutlet weak var error404TextField: UITextField!
    
    // MARK: - Present
    @IBOutlet weak var presentButton: UIButton!
    @IBAction func presentButtonPressed(_ sender: Any) {
        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupCornerRadius()
        setupTextFieldDelegates()
        setupPickerDelegates()
        setupDefaultValues()
    }
}

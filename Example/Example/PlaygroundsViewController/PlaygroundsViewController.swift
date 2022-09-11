//
//  PlaygroundsViewController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import SupportDocs
import SwiftUI
import UIKit

class PlaygroundsViewController: UIViewController {
    var dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

    var options = SupportOptions()

    // MARK: - URLs

    @IBOutlet var dataSourceView: UIView!
    @IBOutlet var dataSourceTextField: UITextField!

    // MARK: - Categories

    @IBOutlet var categoriesView: UIView!

    // MARK: - Navigation Bar

    @IBOutlet var navigationBarView: UIView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var titleColorButton: UIButton!
    @IBOutlet var dismissButtonTitleTextField: UITextField!
    @IBOutlet var buttonTintColorButton: UIButton!
    @IBOutlet var navigationBackgroundColorButton: UIButton!

    @IBAction func titleColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.navigationBar.titleColor = color
        }
    }

    @IBAction func buttonTintColorPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender, withNil: true, colorIsNil: options.navigationBar.buttonTintColor == nil) { [weak self] color in
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
        colorButtonHandler(button: sender, withNil: true, colorIsNil: options.navigationBar.backgroundColor == nil) { [weak self] color in
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

    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchPlaceholderTextField: UITextField!
    @IBOutlet var searchPlaceholderColorButton: UIButton!
    @IBOutlet var searchTextColorButton: UIButton!
    @IBOutlet var searchTintColorButton: UIButton!
    @IBOutlet var searchBackgroundColorButton: UIButton!

    @IBAction func searchPlaceholderColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.placeholderColor = color
        }
    }

    @IBAction func searchTextColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.textColor = color
        }
    }

    @IBAction func searchTintColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.tintColor = color
        }
    }

    @IBAction func searchBackgroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.searchBar?.backgroundColor = color
        }
    }

    let clearButtonModePicker = UIPickerView()
    let clearButtonModeOptions: [UITextField.ViewMode] = [.whileEditing, .unlessEditing, .always, .never]

    @IBOutlet var clearButtonModeButton: InputViewButton!
    @IBAction func clearButtonModePressed(_ sender: InputViewButton) {
        let currentClearButtonMode = options.searchBar?.clearButtonMode

        if let mode = currentClearButtonMode, let firstIndex = clearButtonModeOptions.firstIndex(of: mode) {
            clearButtonModePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }

        clearButtonModeButton.becomeFirstResponder()
    }

    // MARK: - Progress Bar

    @IBOutlet var progressBarView: UIView!
    @IBOutlet var foregroundColorButton: UIButton!
    @IBOutlet var backgroundColorButton: UIButton!

    @IBAction func foregroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            sender.backgroundColor = color
            guard let color = color else { return }
            self?.options.progressBar.foregroundColor = color
        }
    }

    @IBAction func backgroundColorButtonPressed(_ sender: UIButton) {
        colorButtonHandler(button: sender) { [weak self] color in
            guard let color = color else { return }
            sender.backgroundColor = color
            self?.options.progressBar.backgroundColor = color
        }
    }

    // MARK: - List Style

    @IBOutlet var listStyleView: UIView!
    let listStylePicker = UIPickerView()
    let listStyleOptions: [SupportOptions.CustomListStyle] = [.defaultListStyle, .plainListStyle, .groupedListStyle, .insetGroupedListStyle, .insetListStyle, .sidebarListStyle]

    @IBOutlet var listStyleButton: InputViewButton!
    @IBAction func listStyleButtonPressed(_: InputViewButton) {
        let currentListStyle = options.listStyle

        if let firstIndex = listStyleOptions.firstIndex(of: currentListStyle) {
            listStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }

        listStyleButton.becomeFirstResponder()
    }

    // MARK: - Navigation View Style

    @IBOutlet var navigationViewStyleView: UIView!
    let navigationViewStylePicker = UIPickerView()
    let navigationViewStyleOptions: [SupportOptions.CustomNavigationViewStyle] = [.defaultNavigationViewStyle, .doubleColumnNavigationViewStyle, .stackNavigationViewStyle]

    @IBOutlet var navigationViewStyleButton: InputViewButton!
    @IBAction func navigationViewStyleButtonPressed(_: InputViewButton) {
        let currentNavigationViewStyle = options.navigationViewStyle

        if let firstIndex = navigationViewStyleOptions.firstIndex(of: currentNavigationViewStyle) {
            navigationViewStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }

        navigationViewStyleButton.becomeFirstResponder()
    }

    // MARK: - Other

    @IBOutlet var otherView: UIView!
    let activityIndicatorStylePicker = UIPickerView()
    let activityIndicatorStyleOptions: [UIActivityIndicatorView.Style] = [.medium, .large]

    @IBOutlet var activityIndicatorStyleButton: InputViewButton!
    @IBAction func activityIndicatorStyleButtonPressed(_: InputViewButton) {
        let currentActivityIndicatorStyle = options.other.activityIndicatorStyle

        if let firstIndex = activityIndicatorStyleOptions.firstIndex(of: currentActivityIndicatorStyle) {
            activityIndicatorStylePicker.selectRow(firstIndex, inComponent: 0, animated: false)
        }

        activityIndicatorStyleButton.becomeFirstResponder()
    }

    @IBOutlet var error404TextField: UITextField!

    // MARK: - Present

    @IBOutlet var presentButton: UIButton!
    @IBAction func presentButtonPressed(_: Any) {
        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource, options: options)
        present(supportDocsViewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCornerRadius()
        setupTextFieldDelegates()
        setupPickerDelegates()
        setupDefaultValues()
    }
}

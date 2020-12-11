//
//  PlaygroundsViewController+Pickers.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI
import SupportDocs

extension PlaygroundsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case clearButtonModePicker:
            return clearButtonModeOptions.count
        case listStylePicker:
            return listStyleOptions.count
        case navigationViewStylePicker:
            return navigationViewStyleOptions.count
        case activityIndicatorStylePicker:
            return activityIndicatorStyleOptions.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case clearButtonModePicker:
            return clearButtonModeOptions[row].getString()
        case listStylePicker:
            return listStyleOptions[row].getString()
        case navigationViewStylePicker:
            return navigationViewStyleOptions[row].getString()
        case activityIndicatorStylePicker:
            return activityIndicatorStyleOptions[row].getString()
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case clearButtonModePicker:
            let selectedMode = clearButtonModeOptions[row]
            options.searchBar?.clearButtonMode = selectedMode
            
            DispatchQueue.main.async {
                self.clearButtonModeButton.setTitle(selectedMode.getString(), for: .normal)
            }
        case listStylePicker:
            let selectedStyle = listStyleOptions[row]
            options.listStyle = selectedStyle
            
            DispatchQueue.main.async {
                self.listStyleButton.setTitle(selectedStyle.getString(), for: .normal)
            }
        case navigationViewStylePicker:
            let selectedStyle = navigationViewStyleOptions[row]
            options.navigationViewStyle = selectedStyle
            DispatchQueue.main.async {
                self.navigationViewStyleButton.setTitle(selectedStyle.getString(), for: .normal)
            }
        case activityIndicatorStylePicker:
            let selectedStyle = activityIndicatorStyleOptions[row]
            options.other.activityIndicatorStyle = selectedStyle
            DispatchQueue.main.async {
                self.activityIndicatorStyleButton.setTitle(selectedStyle.getString(), for: .normal)
            }
        default:
            return
        }
    }
    
    @objc func dismissPicker() {
        print("dis!")
        view.endEditing(true)
    }
}

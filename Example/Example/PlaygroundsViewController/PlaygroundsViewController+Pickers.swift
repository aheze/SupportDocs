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
        if pickerView == listStylePicker {
            return listStyleOptions.count
        } else {
            return activityIndicatorStyleOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == listStylePicker {
            return listStyleOptions[row].getString()
        } else {
            return activityIndicatorStyleOptions[row].getString()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == listStylePicker {
            let selectedStyle = listStyleOptions[row]
            options.listStyle = selectedStyle
            DispatchQueue.main.async {
                self.listStyleButton.setTitle(selectedStyle.getString(), for: .normal)
            }
        } else {
            let selectedStyle = activityIndicatorStyleOptions[row]
            options.other.activityIndicatorStyle = selectedStyle
            DispatchQueue.main.async {
                self.activityIndicatorStyleButton.setTitle(selectedStyle.getString(), for: .normal)
            }
        }
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
}

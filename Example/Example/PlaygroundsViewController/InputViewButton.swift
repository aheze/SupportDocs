//
//  InputViewButton.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit

/// for the FPS picker
/// allow a toolbar to be added to the picker
class InputViewButton: UIButton {
    var viewForInput = UIView()
    var toolBarView = UIView()
    
    override var inputView: UIView {
        get {
            return self.viewForInput
        }

        set {
            self.viewForInput = newValue
        }
    }
    
    override var inputAccessoryView: UIView {
        get {
            return self.toolBarView
        }
        set {
            self.toolBarView = newValue
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
}

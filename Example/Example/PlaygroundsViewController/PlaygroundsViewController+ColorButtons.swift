//
//  PlaygroundsViewController+ColorButtons.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit

extension PlaygroundsViewController: UIPopoverPresentationControllerDelegate {
    
    // Override the iPhone behavior that presents a popover as fullscreen
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behavior
        return .none
    }
    
    func colorButtonHandler(button: UIButton, withNil: Bool = false, colorIsNil: Bool = false, colorHandler: @escaping ((UIColor?) -> Void)) {
        
        if withNil {
            let popoverVC = ColorPickerControllerWithNil()
            popoverVC.setColor = colorHandler
            popoverVC.isNil = colorIsNil
            
            popoverVC.modalPresentationStyle = .popover
            popoverVC.preferredContentSize = CGSize(width: 260, height: 400)
            if let popoverController = popoverVC.popoverPresentationController {
                popoverController.sourceView = button
                popoverController.sourceRect = button.bounds
                popoverController.permittedArrowDirections = [.right, .down] /// prevent the nil label from being clipped
                popoverController.delegate = self
            }
            present(popoverVC, animated: true, completion: nil)
            
        } else {
            let popoverVC = ColorPickerController()
            popoverVC.setColor = colorHandler
            
            popoverVC.modalPresentationStyle = .popover
            popoverVC.preferredContentSize = CGSize(width: 260, height: 400)
            if let popoverController = popoverVC.popoverPresentationController {
                popoverController.sourceView = button
                popoverController.sourceRect = button.bounds
                popoverController.permittedArrowDirections = .any
                popoverController.delegate = self
            }
            present(popoverVC, animated: true, completion: nil)
        }
    }
}

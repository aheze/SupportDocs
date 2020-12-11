//
//  ViewController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import UIKit
import SwiftUI

/**
 Home screen of the example app.
 */
class ViewController: UIViewController {
    
    @IBOutlet weak var playgroundsButton: UIButton!
    @IBOutlet weak var swiftuiExampleButton: UIButton!
    @IBOutlet weak var uikitExampleButton: UIButton!
    
    @IBAction func playgroundsButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let playgroundsViewController = storyboard.instantiateViewController(withIdentifier: "PlaygroundsViewController") as? PlaygroundsViewController {
            
            playgroundsViewController.title = "Playgrounds"
            playgroundsViewController.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(playgroundsViewController, animated: true)
            
            
//            let hostingViewController = UIHostingController(rootView: PlaygroundsView())
//            
//            hostingViewController.title = "Playgrounds"
//            hostingViewController.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(hostingViewController, animated: true)
            
        }
    }
    
    @IBAction func swiftuiExampleButtonTapped(_ sender: Any) {
        let hostingViewController = UIHostingController(rootView: SwiftUIExampleView())
        
        hostingViewController.title = "SwiftUI Example"
        hostingViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(hostingViewController, animated: true)
    }
    
    @IBAction func uikitExampleButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let uikitExampleViewController = storyboard.instantiateViewController(withIdentifier: "UIKitExampleController") as? UIKitExampleController {
            
            uikitExampleViewController.title = "UIKit Example"
            uikitExampleViewController.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(uikitExampleViewController, animated: true)
            
        }
    }
    
    @IBAction func viewSourcePressed(_ sender: Any) {
        if let url = URL(string: "https://github.com/aheze/SupportDocs") {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SupportDocs"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        playgroundsButton.layer.cornerRadius = 12
        swiftuiExampleButton.layer.cornerRadius = 12
        uikitExampleButton.layer.cornerRadius = 12
    }
}


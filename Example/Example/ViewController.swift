//
//  ViewController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playgroundsButton: UIButton!
    @IBOutlet weak var swiftuiExampleButton: UIButton!
    @IBOutlet weak var uikitExampleButton: UIButton!
    
    @IBAction func playgroundsButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "PlaygroundsViewController") as? PlaygroundsViewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    @IBAction func swiftuiExampleButtonTapped(_ sender: Any) {
    }
    @IBAction func uikitExampleButtonTapped(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playgroundsButton.layer.cornerRadius = 12
        swiftuiExampleButton.layer.cornerRadius = 12
        uikitExampleButton.layer.cornerRadius = 12
    }


}


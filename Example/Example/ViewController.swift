//
//  ViewController.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import SwiftUI
import UIKit

/**
 Home screen of the example app.
 */
class ViewController: UIViewController {
    @IBOutlet var playgroundsButton: UIButton!
    @IBOutlet var swiftuiExampleButton: UIButton!
    @IBOutlet var uikitExampleButton: UIButton!

    @IBAction func playgroundsButtonTapped(_: Any) {
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

    @IBAction func swiftuiExampleButtonTapped(_: Any) {
        let hostingViewController = UIHostingController(rootView: SwiftUIExampleView())

        hostingViewController.title = "SwiftUI Example"
        hostingViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(hostingViewController, animated: true)
    }

    @IBAction func uikitExampleButtonTapped(_: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let uikitExampleViewController = storyboard.instantiateViewController(withIdentifier: "UIKitExampleController") as? UIKitExampleController {
            uikitExampleViewController.title = "UIKit Example"
            uikitExampleViewController.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(uikitExampleViewController, animated: true)
        }
    }

    @IBAction func viewSourcePressed(_: Any) {
        if let url = URL(string: "https://github.com/aheze/SupportDocs") {
            UIApplication.shared.open(url)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SupportDocs"
        navigationController?.navigationBar.prefersLargeTitles = true

        playgroundsButton.layer.cornerRadius = 12
        swiftuiExampleButton.layer.cornerRadius = 12
        uikitExampleButton.layer.cornerRadius = 12
    }
}

//
//  Utilities.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI

/**
 Configure the navigation bar's look
 
 Source: [https://stackoverflow.com/a/58427754/14351818](https://stackoverflow.com/a/58427754/14351818)
 */
internal struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

/**
 Hide or show a View (support for iOS 13)
 
 Source: [https://stackoverflow.com/a/57685253/14351818](https://stackoverflow.com/a/57685253/14351818)
 */
internal extension View {
   @ViewBuilder
   func ifConditional<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}


internal extension View {
    @ViewBuilder
    func displayTextAsConfigured() -> some View {
        if #available(iOS 14, *) {
            self.textCase(nil)
        } else {
            self
        }
    }
}

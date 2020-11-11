//
//  Footer.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        Button(action: {
            let urlToOpen = URL.init(string: "https://www.apple.com")!
            if UIApplication.shared.canOpenURL(urlToOpen) {
                UIApplication.shared.open(urlToOpen)
            }
        }) {
            (
                Text("Didn't find what you were looking for? Contact us at our ")
                    +
                Text("website")
                .underline()
                .foregroundColor(Color.blue)
                    +
                Text("!")
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.system(size: 16, weight: .regular))
            .foregroundColor(Color(UIColor.label))
        }
        .padding(.horizontal, 8)
    }
}

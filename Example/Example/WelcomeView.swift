//
//  WelcomeView.swift
//  Example
//
//  Created by Zheng on 11/7/20.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "arrow.up.left")
                        .font(.system(size: 50, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                        .padding(EdgeInsets(top: 20, leading: 100, bottom: 0, trailing: 0))
                    Spacer()
                }
                Spacer()
            }
            Text("Tap Support to start browsing!")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(.secondaryLabel))
        }
    }
}


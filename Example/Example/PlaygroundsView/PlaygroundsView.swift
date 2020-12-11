//
//  PlaygroundsView.swift
//  Example
//
//  Created by Zheng on 11/29/20.
//

import SwiftUI

struct PlaygroundsView: View {
    
    @State var dataSourceURL = ""
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            VStack {
                
                VStack(alignment: .leading) {
                    Text("Data Source")
                        .foregroundColor(Color.secondary)
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))
                    
                    TextField("Data", text: $dataSourceURL)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                
                VStack(alignment: .leading) {
                    Text("Categories")
                        .foregroundColor(Color.secondary)
                        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Nil (Display all documents)")
                        .foregroundColor(Color.secondary)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        
                }
                
            }
        }
    }
}

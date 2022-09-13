//
//  CustomGroup.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/12/22.
//

import SwiftUI

struct CustomGroup<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        Group {
            self.content()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}



//
//  UserBubble.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/12/22.
//

import SwiftUI

struct UserBubble: View {
    var user: User?
    @Binding var current: User?
    @Binding var showDetails: Bool
    
    var body: some View {
        Button(action: {
            current = user!
            showDetails = true
        }) {
            HStack {
                ZStack {
                    if ((user?.isActive)!!) {
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        Circle().stroke(Color.red, lineWidth: 1).frame(width: 30, height: 30)
                    } else {
                        Circle().fill(Color.black.opacity(0.2)).frame(width: 20, height: 20)
                        Circle().stroke(Color.black.opacity(0.2), lineWidth: 1).frame(width: 30, height: 30)
                    }
                }
                Text((user?.name)!!)
                Spacer()
            }
            
        }
    }
}

//
//  ContentView.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(users) { user in
                            UserBubble(user: user)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Users")
            .onAppear() {
                Services.shared.fetchUsers { (response, error) -> (Void) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    users = response!
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

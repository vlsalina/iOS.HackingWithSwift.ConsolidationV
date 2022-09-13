//
//  Details.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/12/22.
//

import SwiftUI

struct Details: View {
    var user: User?
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Details")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                }
                .padding([.top], 5)
                CustomGroup() {
                    VStack {
                        HStack {
                            Text(user!.email!)
                            Spacer()
                        }
                        HStack {
                            Text(user!.address!)
                            Spacer()
                        }
                        HStack {
                            Text("Age: \(user!.age!)")
                            Spacer()
                        }
                        HStack {
                            Text("Member since: \(DateViewModel.formatDate(date: user!.registered!))")
                            Spacer()
                        }
                    }
                }
                CustomGroup() {
                    HStack {
                        Text("Current: \(user!.company!)")
                        Spacer()
                    }
                    
                }
                
            }
            VStack {
                HStack {
                    Text("About")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                }
                .padding([.top], 5)
                CustomGroup() {
                    Text(user!.about!)
                }
            }
            TagGroup(tags: user!.tags!)
            Section {
                LazyVStack {
                    ForEach(user!.friends!) { friend in
                        CustomGroup() {
                            HStack {
                                Text(friend.name!)
                                Spacer()
                            }
                        }
                    }
                }
            } header: {
                HStack {
                    Text("Friends")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                }
            }
            .padding([.top], 5)
        }
        .padding(.horizontal)
        .navigationTitle(user!.name!)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}

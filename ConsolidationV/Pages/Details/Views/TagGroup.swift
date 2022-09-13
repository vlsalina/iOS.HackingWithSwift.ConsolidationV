//
//  TagGroup.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/13/22.
//

import SwiftUI

struct TagGroup: View {
    //    var tags: [String]?
    
    //    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    //    init(items: [String]) {
    init(tags: [String]) {
        //        self.items = items
        //        self.tags = tags
        self.groupedItems = createGroupedItems(tags)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        return groupedItems
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Tags")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.5))
                Spacer()
            }
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        Text(word)
                            .fixedSize()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    }
                }
            }
            Spacer()
        }
        .padding([.top], 5)
    }
}


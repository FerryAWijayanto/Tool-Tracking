//
//  ToolsStore.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import Foundation

class ToolsStore {
    
    var items: [ToolsItem] = []
    
    func fetch() {
        DataManager.shared.fetch { (items) in
            items.forEach { (item) in
                self.items.append(item)
            }
        }
    }
    
    func tools(at indexPath: IndexPath) -> ToolsItem {
        return items[indexPath.item]
    }
}

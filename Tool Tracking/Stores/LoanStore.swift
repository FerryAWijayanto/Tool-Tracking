//
//  LoanStore.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import Foundation

class LoanStore {
    
    var items = [[Item](), [Item]()]
    
    @discardableResult func add(_ item: Item, at index: Int, isLoan: Bool = false) -> Item {
        let newLoan = Item(item: item.item, borrower: item.borrower)
        let section = isLoan ? 1 : 0
        
        items[section].insert(newLoan, at: index)
        return newLoan
    }
    
    @discardableResult func removeLoan(at index: Int, isLoan: Bool = false) -> Item {
        let section = isLoan ? 1 : 0
        
        return items[section].remove(at: index)
    }
}

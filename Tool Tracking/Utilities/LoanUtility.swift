//
//  LoanUtility.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import Foundation

class LoanUtility {
    private static let key = "loan"
    
    // archive
    private static func archive(_ loan: [Item]) -> Data? {
        
        return try? NSKeyedArchiver.archivedData(withRootObject: loan, requiringSecureCoding: false)
    }
    
    // fetch
    static func fetch() -> [Item]? {
        guard let unarchiveData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        
        return NSKeyedUnarchiver.unarchiveObject(with: unarchiveData) as? [Item]
    }
    
    // save
    static func save(_ loan: [Item]) {
        // Archive data
        let archiveTask = archive(loan)
        
        // Set object for key
        UserDefaults.standard.set(archiveTask, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

//
//  DataManager.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import Foundation

//protocol DataManager {
//    func load(file name: String) -> [[String: AnyObject]]
//}
//
//extension DataManager {
//    func load(file name: String) -> [[String: AnyObject]] {
//        guard
//            let path = Bundle.main.path(forResource: name, ofType: "plist"),
//            let items = NSArray(contentsOfFile: path) else {
//                return [[:]]
//        }
//        return items as! [[String: AnyObject]]
//    }
//}

class DataManager {

    static let shared = DataManager()

    func fetch(completion: @escaping ([ToolsItem]) -> Void) {
        if let path = Bundle.main.path(forResource: "ToolsData", ofType: "plist") {
            let fileURL = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: fileURL)
                let items = try PropertyListDecoder().decode([ToolsItem].self, from: data)
                completion(items)
            } catch let error as NSError {
                print("\(error)")
            }
        }
    }
}

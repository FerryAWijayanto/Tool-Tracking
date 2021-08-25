//
//  ToolsItem.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import Foundation

struct ToolsItem: Codable {
    let imageIcon: String
    let toolsName: String
    let items: [Item]
}

struct Item: Codable {
    let item: String
    let borrower: String
}

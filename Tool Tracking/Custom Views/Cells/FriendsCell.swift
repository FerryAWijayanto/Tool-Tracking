//
//  FriendsCell.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class FriendsCell: UITableViewCell {

    static let identifier = "FriendsCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

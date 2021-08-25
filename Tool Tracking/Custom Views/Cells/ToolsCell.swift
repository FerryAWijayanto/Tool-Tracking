//
//  ToolsCell.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class ToolsCell: UITableViewCell {
    static let identifier = "ToolsCell"
    
    let dummyImageView: UIImageView = {
        let v = UIImageView()
//        v.backgroundColor = .systemGray5
//        v.layer.cornerRadius = 30
        v.clipsToBounds = true
        return v
    }()
    
    let toolName: UILabel = {
        let label = UILabel()
        label.text = "Dummy Name"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: ToolsItem) {
        dummyImageView.image = UIImage(named: item.imageIcon)
        toolName.text = item.toolsName
    }
    
    private func setupViews() {
        [dummyImageView, toolName].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            dummyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dummyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            dummyImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            dummyImageView.widthAnchor.constraint(equalToConstant: 60),
            
            toolName.leadingAnchor.constraint(equalTo: dummyImageView.trailingAnchor, constant: 16),
            toolName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            toolName.widthAnchor.constraint(equalToConstant: 240)
        ])
    }

}

//
//  ListLoanController.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 25/08/21.
//

import UIKit

class ListLoanController: UIViewController {
    
    var tableView: UITableView!
    let cellID = "cellID"
    
    var loanLists = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
    }
}

extension ListLoanController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loanLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let item = loanLists[indexPath.row]
        
        cell.textLabel?.text = item.item
        return UITableViewCell()
    }
    
    
}

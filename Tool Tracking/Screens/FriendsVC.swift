//
//  FriendsVC.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class FriendsVC: UIViewController {
    
    var tableView: UITableView!
    var names = ["Brian", "Luke", "Letty", "Shaw", "Parker"]
    var items = LoanUtility.fetch()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendsCell.self, forCellReuseIdentifier: FriendsCell.identifier)
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension FriendsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let borrower = items?[indexPath.row].borrower
        print(items)
//        print(borrower)
        let item = names[indexPath.row]
        
        if borrower == item {
            let listLoanVC = ListLoanController()
            listLoanVC.title = item
            listLoanVC.loanLists = items ?? []
            
            navigationController?.pushViewController(listLoanVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

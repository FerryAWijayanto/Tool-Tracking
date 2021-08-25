//
//  ListsDetailVC.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class ListsDetailVC: UIViewController {
    
    var tableView: UITableView!
    
    var store: LoanStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(ListsDetailCell.self, forCellReuseIdentifier: ListsDetailCell.identifier)
        view.addSubview(tableView)
    }
}

extension ListsDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Tools" : "Loan"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return store.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListsDetailCell.identifier, for: indexPath)
        
        let item = store.items[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = item.item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = store.items[indexPath.section][indexPath.row]
        
        let addLoanVC = AddLoanVC()
        addLoanVC.itemLoan = itemSelected
        addLoanVC.store = store
        addLoanVC.isDismiss = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        navigationController?.present(addLoanVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            store.removeLoan(at: indexPath.row, isLoan: true)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
}

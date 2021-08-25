//
//  ToolsVC.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class ToolsVC: UIViewController {
    
    var tableView: UITableView!
    let store = ToolsStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetch()
        tableView = UITableView(frame: view.bounds)
        tableView.rowHeight = 75
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToolsCell.self, forCellReuseIdentifier: ToolsCell.identifier)
        view.addSubview(tableView)
    }
}

extension ToolsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToolsCell.identifier, for: indexPath) as! ToolsCell
        
        let item = store.tools(at: indexPath)
        
        cell.set(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = store.tools(at: indexPath)
        let listItem = item.items
        
        let loanStore = LoanStore()
        loanStore.items[0] = listItem
                
        let detailVC = ListsDetailVC()
        detailVC.store = loanStore
        
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

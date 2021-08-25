//
//  AddLoanVC.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class AddLoanVC: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
//        label.layer.borderColor = UIColor.red.cgColor
//        label.layer.borderWidth = 1
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.layer.cornerRadius = 4
        tf.layer.borderColor = UIColor.red.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    let saveBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 4
        btn.addTarget(self, action: #selector(addLoan), for: .touchUpInside)
//        btn.layer.borderColor = UIColor.red.cgColor
//        btn.layer.borderWidth = 1
        return btn
    }()
    
    var itemLoan: Item!
    var store: LoanStore!
    var isDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    @objc private func addLoan() {
        let borrower = Item(item: itemLoan.item, borrower: nameTextField.text ?? "")
        LoanUtility.save([borrower])
        store.add(borrower, at: 0, isLoan: true)
        dismiss(animated: true)
        self.isDismiss?()
    }
    
    private func setupViews() {
        [nameLabel, nameTextField, saveBtn].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            saveBtn.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
            saveBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

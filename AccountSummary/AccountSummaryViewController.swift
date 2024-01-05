//
//  AccountSummaryController.swift
//  Bankey
//
//  Created by Elif İlay Eser
//

import UIKit

import UIKit

class AccountSummaryViewController: UIViewController {
    
    
    struct Profile{
        let firstName: String
        let lastName: String
    }
    
    var profile: Profile?
    var accounts: [AccountSummaryCell.ViewModel] = []
    
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableHeaderView()
    }
}

extension AccountSummaryViewController {
    
    private func setup() {
        setupTableView()
        fetchData()
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        
        tableView.setUpConstraints(leadingAnchor:view.safeAreaLayoutGuide.leadingAnchor, topAnchor:view.safeAreaLayoutGuide.topAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor,bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor)
        
        
    }
    private func fetchData() {
            let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                        accountName: "Basic Savings")
            let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                           accountName: "Visa Avion Card")
            let investment = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                           accountName: "Tax-Free Saver")

            accounts.append(savings)
            accounts.append(visa)
            accounts.append(investment)
        }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

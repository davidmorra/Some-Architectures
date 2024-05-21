//
//  UsersViewController.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

import UIKit

protocol UsersViewControllerInput: AnyObject {
    var presenter: UsersViewControllerOutput? { get set }
    func showUsers(_ users: [User])
}

protocol UsersViewControllerOutput: AnyObject {
    func didSelectUser(_ id: User)
    func viewDidLoad()
}

class UsersViewController: UIViewController, UsersViewControllerInput {
    enum Section {
        case main
    }
    
    private var datasource: UITableViewDiffableDataSource<Section, User>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
    
    var presenter: UsersViewControllerOutput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Users"
        
        view.addSubview(tableView)
        tableView.delegate = self
        
        datasource = UITableViewDiffableDataSource<Section, User>(tableView: tableView, cellProvider: { tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var conf = cell.defaultContentConfiguration()
            conf.text = user.name
            cell.contentConfiguration = conf
            return cell
        })
        
        presenter?.viewDidLoad()
    }
    
    func showUsers(_ users: [User]) {
        snapshot.appendSections([.main])
        snapshot.appendItems(users, toSection: .main)
        datasource.apply(snapshot)
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = datasource.snapshot().itemIdentifiers[indexPath.row]
        presenter?.didSelectUser(user)
    }
}

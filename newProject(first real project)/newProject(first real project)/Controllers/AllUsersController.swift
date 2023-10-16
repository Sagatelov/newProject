//
//  AllUsersController.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import UIKit

class AllUsersController: UIViewController, StorybordedProtocol, Navigator {
  
    @IBOutlet weak var loadUsersActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usersTableView: UITableView! {
        didSet {
            usersTableView.delegate = self
            usersTableView.dataSource = self
            let xib = UINib(nibName: "TableViewCellUsersXib" , bundle: nil)
            usersTableView.register(xib, forCellReuseIdentifier: "XibUsers")
        }
    }
    
    private let networKManager = NetworkManager()
    weak var navigator: UsersNavigator?
    var users = [UsersModel]() {
        didSet {
            usersTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsersActivityIndicator.startAnimating()
        networKManager.loadAllUsers { userArray in
            DispatchQueue.main.async {
                self.users = userArray
                self.loadUsersActivityIndicator.stopAnimating()
            }
        }
    }
}


extension AllUsersController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: "XibUsers", for: indexPath) as! TableViewCellUsersXib
        cell.configur(data: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigator = navigator {
            navigator.showNext(page: .postsPage(users[indexPath.row]))
        }
    }
}

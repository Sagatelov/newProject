//
//  AllUserPostsController.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import UIKit

class AllPostsOfUserController: UIViewController, StorybordedProtocol, Navigator {
    
    @IBOutlet weak var selectedPostsTableView: UITableView! {
        didSet {
            selectedPostsTableView.dataSource = self
            selectedPostsTableView.delegate = self
            
            let xib = UINib(nibName: "TableViewCellPostsXib", bundle: nil)
            selectedPostsTableView.register(xib, forCellReuseIdentifier: "XibPostsId")
        }
    }
    
    private let networKManager = NetworkManager()
    weak var navigator: UsersNavigator?
    var selectedUser: UsersModel  //did tap user on users controller
    
    var posts: [PostsModel] = [] {
        didSet {
            selectedPostsTableView.reloadData()
        }
    }
    
    //sort all posts form Network by selectedUser
    var selectedPosts: [PostsModel] {
        get {
            var post = [PostsModel]()
            for i in posts {
                if i.userId == selectedUser.id {
                    post.append(i)
                }
            }
            return post
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networKManager.loadAllPosts { posts in
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
    }
    
    
    //MARK: - initialization code
    
    init?(selectedUser: UsersModel, coder: NSCoder) {
        self.selectedUser = selectedUser
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(selectedUser:coder:)")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - extensions

extension AllPostsOfUserController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectedPostsTableView.dequeueReusableCell(withIdentifier: "XibPostsId", for: indexPath) as! TableViewCellPostsXib
        cell.configurePostsPagae(selectedPosts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigator = navigator {
            navigator.showNext(page: .commentsPage(selectedPosts[indexPath.row]))
        }
    }
}



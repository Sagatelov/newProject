//
//  AllPostCommentsController.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 29.08.2023.
//

import UIKit

class AllCommentsOfPostsController: UIViewController, StorybordedProtocol, Navigator {
    
    @IBOutlet weak var commetsPageTabel: UITableView! {
        didSet {
            commetsPageTabel.dataSource = self
            commetsPageTabel.delegate = self
            
            let xib = UINib(nibName: "CommentsCell", bundle: nil)
            commetsPageTabel.register(xib, forCellReuseIdentifier: "CommentsCellId" )
            
        }
    }
    
    weak var navigator: UsersNavigator?
    private let networKManager = NetworkManager()
    
    let selectedPost: PostsModel
    var allComments = [CommentsModel]() {
        didSet {
            commetsPageTabel.reloadData()
        }
    }
    
    var sortedComents: [CommentsModel] {
        get {
            var comments = [CommentsModel]()
            for id in allComments {
                if id.postId == selectedPost.id {
                    comments.append(id)
                }
            }
            return comments
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networKManager.loadAllComments { comments in
            DispatchQueue.main.async {
                self.allComments = comments
            }
        }
    }
        
    //MARK: - initialization
        
    init?(selectedPost: PostsModel, coder: NSCoder){
        self.selectedPost = selectedPost
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(selectedPost:coder:)")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AllCommentsOfPostsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedComents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commetsPageTabel.dequeueReusableCell(withIdentifier: "CommentsCellId", for: indexPath) as! CommentsCell
        cell.configure(coments: sortedComents[indexPath.row])
        return cell
    }
    
}

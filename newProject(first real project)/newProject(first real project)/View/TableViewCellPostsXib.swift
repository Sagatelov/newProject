//
//  TableViewCellPostsXib.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 04.09.2023.
//

import UIKit

class TableViewCellPostsXib: UITableViewCell {

    
    @IBOutlet weak var postLable: UILabel!
    
    
    func configurePostsPagae(_ post: PostsModel) {
        postLable.text = post.body
        
    }
}

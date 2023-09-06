//
//  CommentsCell.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 05.09.2023.
//

import UIKit

class CommentsCell: UITableViewCell {

    @IBOutlet weak var commentsLable: UILabel!
    
    
    func configure(coments: CommentsModel) {
        commentsLable.text = coments.body
    }
}

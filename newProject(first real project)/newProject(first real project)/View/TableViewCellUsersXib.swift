//
//  TableViewCellUsersXib.swift
//  newProject(first real project)
//
//  Created by Andrew Sagatelov on 02.09.2023.
//

import UIKit

class TableViewCellUsersXib: UITableViewCell {
    
    @IBOutlet weak var UsersDataLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configur(data: UsersModel) {
        UsersDataLable.text = data.email
    }
    
}

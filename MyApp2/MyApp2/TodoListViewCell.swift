//
//  TodoListViewCell.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit

class TodoListViewCell: UITableViewCell {

    @IBOutlet weak var isCompleted: UISwitch!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var importance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

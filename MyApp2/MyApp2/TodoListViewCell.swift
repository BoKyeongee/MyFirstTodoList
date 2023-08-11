//
//  TodoListViewCell.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit

class TodoListViewCell: UITableViewCell {

    @IBOutlet weak var isCompleted: UISwitch!
    @IBOutlet weak var title: UILabel!
    
    
    @IBAction func isCompletedAct(_ sender: Any) {
        UserDefaults.standard.set(cell.isCompleted.isOn, forKey: "switchState")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isCompleted.isOn = true
        isCompleted.tintColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

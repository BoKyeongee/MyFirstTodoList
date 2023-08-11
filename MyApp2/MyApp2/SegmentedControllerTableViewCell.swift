//
//  SegmentedControllerTableViewCell.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/10.
//

import UIKit

class SegmentedControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var empty: UILabel!
    @IBOutlet weak var isCompleted: UISwitch!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

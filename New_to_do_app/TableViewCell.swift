//
//  TableViewCell.swift
//  New_to_do_app
//
//  Created by Жанадил on 2/25/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

@IBDesignable class toDoCell: UITableViewCell {

    @IBOutlet weak var checkedLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

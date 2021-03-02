//
//  TableViewCell.swift
//  New_to_do_app
//
//  Created by Жанадил on 2/26/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

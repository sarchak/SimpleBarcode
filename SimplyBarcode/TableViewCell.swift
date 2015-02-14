//
//  TableViewCell.swift
//  SimplyBarcode
//
//  Created by Shrikar Archak on 2/8/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var supplierName: UILabel!
    @IBOutlet weak var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by aida madraimova on 15.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var GenreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

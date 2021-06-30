//
//  LocationsCell.swift
//  Makany
//
//  Created by عبدالعزيز رضا  on 5/26/21.
//

import UIKit

class LocationsCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var des: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

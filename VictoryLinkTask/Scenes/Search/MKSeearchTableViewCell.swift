//
//  MKSeearchTableViewCell.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/17/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import MapKit

class MKSeearchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(with mapItem: MKMapItem) {
        
    }
}

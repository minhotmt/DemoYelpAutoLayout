//
//  BusinessCell.swift
//  DemoYelpAutoLayout
//
//  Created by MinhNV on 5/20/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var numReview: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var sninppetLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBusiness(business: Business){
        self.thumbImageView.image = UIImage(named: business.imageUrl)
        self.ratingImageView.image = UIImage(named: business.ratingImageUrl)
        self.categoryLabel.text = business.categories
        self.numReview.text = String(business.numReviews) + "Reviews"
        self.nameLabel.text = business.name
        self.addressLabel.text = business.address
        self.distanceLabel.text = String(business.distance)
        self.sninppetLabel.text = business.snippet
    }
    
}

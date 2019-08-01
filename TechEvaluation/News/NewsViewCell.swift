//
//  NewsViewCell.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.newsView.layer.cornerRadius = 6
        self.newsView.layer.masksToBounds = true
        self.newsImage.layer.cornerRadius = 35
        self.newsImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

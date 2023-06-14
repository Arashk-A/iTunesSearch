//
//  SearchItemCell.swift
//  ItunesSearch
//
//  Created by zero on 6/14/23.
//

import UIKit

class SearchItemCell: UITableViewCell {
  
  @IBOutlet weak var artwork: UIImageView!
  @IBOutlet weak var artistName: UILabel!
  @IBOutlet weak var trackName: UILabel!
  @IBOutlet weak var releaseDate: UILabel!
  @IBOutlet weak var shortInfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

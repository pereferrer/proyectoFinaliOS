//
//  PostsByCategoryTableViewCell.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 26/10/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit

class PostsByCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(urlsString: String) {
        let finalUrlString = "https://mdiscourse.keepcoding.io" + urlsString.replacingOccurrences(of: "{size}", with: "120")
        let url = URL(string: finalUrlString)!
        self.imageProfile.load(url: url)
        self.imageProfile.roundImage()
    }
    
}

//
//  DescriptionImageTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class DescriptionImageTableViewCell: UITableViewCell {
    static let identifier = "DescriptionImageTableViewCell"
    
    @IBOutlet weak var hotelImageView: UIImageView!
    
    func setupCell(imageName: String) {
        hotelImageView.image = UIImage(named: imageName)
        hotelImageView.contentMode = .scaleAspectFill
    }
    
}

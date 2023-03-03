//
//  DescriptionDetailTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class DescriptionDetailTableViewCell: UITableViewCell {
    static let identifier = "DescriptionDetailTableViewCell"
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelDescriptionTextView: UITextView!
    
    func setupCell(hotelName: String, hotelDescription: String) {
        hotelNameLabel.text = hotelName
        hotelDescriptionTextView.text = hotelDescription
        
        setupComponentAttributes()
    }
    
    func setupComponentAttributes() {
        hotelNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        hotelNameLabel.numberOfLines = 0
        
        hotelDescriptionTextView.font = UIFont.systemFont(ofSize: 16)
        hotelDescriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: -4)
    }
    
}

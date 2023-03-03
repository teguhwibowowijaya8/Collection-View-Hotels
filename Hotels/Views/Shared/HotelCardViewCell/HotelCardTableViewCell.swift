//
//  HotelCardTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class HotelCardTableViewCell: UITableViewCell {
    static let identifier = "HotelCardTableViewCell"
    
    @IBOutlet weak var hotelCardView: UIView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelAddressLabel: UILabel!
    @IBOutlet weak var hotelPriceLabel: UILabel!
    @IBOutlet weak var hotelRatingLabel: RatingLabel!
    
    func setupCell(hotel: Hotel) {
        hotelImageView.image = UIImage(named: hotel.imageName)
        hotelNameLabel.text = hotel.name
        hotelAddressLabel.text = hotel.address
        hotelPriceLabel.text = hotel.priceString
        hotelRatingLabel.ratingScore = hotel.rating
        
        setupComponentAttributes()
        setupComponentConstraints()
    }
    
    func setupComponentAttributes() {
        hotelNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        hotelNameLabel.adjustsFontSizeToFitWidth = true
        hotelNameLabel.numberOfLines = 2
        
        hotelPriceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        hotelPriceLabel.adjustsFontSizeToFitWidth = true
        
        hotelAddressLabel.font = UIFont.systemFont(ofSize: 16)
        hotelAddressLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        hotelAddressLabel.numberOfLines = 3
        hotelAddressLabel.adjustsFontSizeToFitWidth = true
        
        hotelImageView.contentMode = .scaleAspectFill
        hotelImageView.layer.cornerRadius = 15
        hotelImageView.clipsToBounds = true
    }
    
    func setupComponentConstraints() {
        hotelCardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

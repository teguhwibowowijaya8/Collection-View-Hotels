//
//  HotelImageCardCollectionCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class HotelImageCardCollectionCell: UICollectionViewCell {
    static let identifier = "HotelImageCardCollectionCell"
    
    @IBOutlet weak var hotelCardView: UIView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelPriceLabel: UILabel!
    @IBOutlet weak var hotelRatingLabel: RatingLabel!
    
    
    func setupCell(hotel: Hotel) {
        hotelImageView.image = UIImage(named: hotel.imageName)
        hotelNameLabel.text = hotel.name
        hotelPriceLabel.text = hotel.priceString
        hotelRatingLabel.ratingScore = hotel.rating
        
        setupComponentAttributes()
    }
    
    func setupComponentAttributes() {
        hotelNameLabel.textColor = .white
        hotelNameLabel.font = .boldSystemFont(ofSize: 16)
        hotelNameLabel.numberOfLines = 2
        hotelNameLabel.adjustsFontSizeToFitWidth = true
        
        hotelPriceLabel.textColor = .white
        hotelPriceLabel.font = .boldSystemFont(ofSize: 16)
        hotelPriceLabel.adjustsFontSizeToFitWidth = true
        
        hotelRatingLabel.textColor = .white
        hotelRatingLabel.font = .boldSystemFont(ofSize: 16)
        
        hotelImageView.contentMode = .scaleAspectFill
        
        hotelCardView.layer.cornerRadius = 15
        hotelCardView.clipsToBounds = true
        
    }

}

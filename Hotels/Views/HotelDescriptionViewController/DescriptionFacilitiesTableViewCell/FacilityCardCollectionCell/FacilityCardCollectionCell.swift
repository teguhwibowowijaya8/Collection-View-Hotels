//
//  FacilityCardCollectionCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class FacilityCardCollectionCell: UICollectionViewCell {
    static let identifier = "FacilityCardCollectionCell"
    
    @IBOutlet weak var facilityCardView: UIView!
    @IBOutlet weak var facilityImageView: UIImageView!
    @IBOutlet weak var facilityNameLabel: UILabel!
    @IBOutlet weak var facilityDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var starImageOne: UIImageView!
    @IBOutlet weak var starImageTwo: UIImageView!
    @IBOutlet weak var starImageThree: UIImageView!
    @IBOutlet weak var starImageFour: UIImageView!
    @IBOutlet weak var starImageFive: UIImageView!
    
    func setupCell(facility: Facility) {
        facilityImageView.image = UIImage(named: "Hotel")
        facilityNameLabel.text = facility.name
        facilityDescriptionLabel.text = facility.briefDescription
        setupStarImages(rating: facility.rating)
        
        setupComponentAttributes()
    }
    
    func setupStarImages(rating: Double) {
        print(rating)
        switch rating {
        case 0.5...1:
            starImageOne.image = UIImage(systemName: "star.fill")
        case 1.5...2:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
        case 2.5...3:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: "star.fill")
        case 3.5...4:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: "star.fill")
            starImageFour.image = UIImage(systemName: "star.fill")
        case 4.5...5.0:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: "star.fill")
            starImageFour.image = UIImage(systemName: "star.fill")
            starImageFive.image = UIImage(systemName: "star.fill")
        default:
            break
        }
    }
    
    func setupComponentAttributes() {
        facilityCardView.backgroundColor = UIColor(red: 0.121, green: 0.117, blue: 0.118, alpha: 0.25)
        facilityCardView.layer.cornerRadius = 10
        
        facilityImageView.layer.cornerRadius = 10
        facilityImageView.clipsToBounds = true
        facilityImageView.contentMode = .scaleAspectFill
        
        facilityNameLabel.font = .boldSystemFont(ofSize: 16)
        facilityNameLabel.adjustsFontSizeToFitWidth = true
        
        facilityDescriptionLabel.textColor = .darkGray
        facilityDescriptionLabel.adjustsFontSizeToFitWidth = true
    }

}

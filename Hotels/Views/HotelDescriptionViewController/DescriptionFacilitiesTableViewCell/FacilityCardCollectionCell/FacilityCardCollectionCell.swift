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
        let decimalRating = rating.truncatingRemainder(dividingBy: 1)
        let decimalImageName = starImageTruncate(decimalRating)
        switch rating {
        case 0.0...1:
            starImageOne.image = UIImage(systemName: decimalImageName)
            starImageTwo.image = UIImage(systemName: "star")
            starImageThree.image = UIImage(systemName: "star")
            starImageFour.image = UIImage(systemName: "star")
            starImageFive.image = UIImage(systemName: "star")
        case 1.5...2.0:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: decimalImageName)
            starImageThree.image = UIImage(systemName: "star")
            starImageFour.image = UIImage(systemName: "star")
            starImageFive.image = UIImage(systemName: "star")
        case 2.1...3.0:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: decimalImageName)
            starImageFour.image = UIImage(systemName: "star")
            starImageFive.image = UIImage(systemName: "star")
        case 3.1...4.0:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: "star.fill")
            starImageFour.image = UIImage(systemName: decimalImageName)
            starImageFive.image = UIImage(systemName: "star")
        case 4.1...5.0:
            starImageOne.image = UIImage(systemName: "star.fill")
            starImageTwo.image = UIImage(systemName: "star.fill")
            starImageThree.image = UIImage(systemName: "star.fill")
            starImageFour.image = UIImage(systemName: "star.fill")
            starImageFive.image = UIImage(systemName: decimalImageName)
        default:
            break
        }
    }
    
    func starImageTruncate(_ truncateRating: Double) -> String {
        switch truncateRating {
        case 0.0...0.3:
            return "star"
        case 0.4...0.7:
            return "star.leadinghalf.filled"
        case 0.8...:
            return "star.fill"
        default:
            return "star"
        }
    }
    
    func setupComponentAttributes() {
        facilityCardView.backgroundColor = UIColor(red: 0.121, green: 0.117, blue: 0.118, alpha: 0.15)
        facilityCardView.layer.cornerRadius = 10
        
        facilityImageView.layer.cornerRadius = 10
        facilityImageView.clipsToBounds = true
        facilityImageView.contentMode = .scaleAspectFill
        
        facilityNameLabel.font = .boldSystemFont(ofSize: 16)
        facilityNameLabel.adjustsFontSizeToFitWidth = true
        
        facilityDescriptionLabel.numberOfLines = 2
        facilityDescriptionLabel.textColor = .darkGray
        facilityDescriptionLabel.adjustsFontSizeToFitWidth = true
    }

}

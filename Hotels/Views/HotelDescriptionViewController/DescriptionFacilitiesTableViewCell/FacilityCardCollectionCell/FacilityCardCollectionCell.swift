//
//  FacilityCardCollectionCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class FacilityCardCollectionCell: UICollectionViewCell {
    static let identifier = "FacilityCardCollectionCell"
    
    
    @IBOutlet weak var imageShadowView: UIView!
    @IBOutlet weak var facilityCardView: UIView!
    @IBOutlet weak var facilityImageView: UIImageView!
    @IBOutlet weak var facilityNameLabel: UILabel!
    @IBOutlet weak var facilityDescriptionLabel: UILabel!
    @IBOutlet weak var starsStackView: UIStackView!
    private lazy var starsImageViews = [UIImageView]()
    
    
    func setupCell(facility: Facility) {
        facilityImageView.image = UIImage(named: "Hotel")
        facilityNameLabel.text = facility.name
        facilityDescriptionLabel.text = facility.briefDescription

        setupImageShadowView()
        setupStarsStackView(rating: facility.rating)
        setupComponentAttributes()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        starsImageViews = [UIImageView]()
        
        starsStackView.arrangedSubviews.forEach {subview in
            subview.removeFromSuperview()
        }
    }
    
    func setupImageShadowView() {
        imageShadowView.layer.cornerRadius = 10
        imageShadowView.layer.borderWidth = 3
        imageShadowView.layer.borderColor = UIColor.black.cgColor
        
        imageShadowView.layer.shadowColor = UIColor.black.cgColor
        imageShadowView.layer.shadowOpacity = 1
        imageShadowView.layer.shadowOffset = .zero
        imageShadowView.layer.shadowRadius = 2
    }
    
    func setupStarsStackView(rating: Double, maxRating: Int = 5) {
        let firstRating = Int(floor(rating))
        let remaiderRating = rating.truncatingRemainder(dividingBy: 1)
        
        for index in 1...maxRating {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.tintColor = .yellow
            
            if index <= firstRating {
                starImageView.image = UIImage(systemName: "star.fill")
                starImageView.restorationIdentifier = "star.fill"
            } else if index == firstRating + 1 {
                let imageName = starImageTruncate(remaiderRating)
                starImageView.image = UIImage(systemName: imageName)
                starImageView.restorationIdentifier = imageName
            } else {
                starImageView.image = UIImage(systemName: "star")
                starImageView.restorationIdentifier = "star"
            }
            
            starsImageViews.append(starImageView)
            starsStackView.addArrangedSubview(starsImageViews[index-1])
        }
    }
    
    func starImageTruncate(_ truncateRating: Double) -> String {
        switch truncateRating {
        case 0.0...0.3:
            return "star"
        case 0.4...0.7:
            return "star.leadinghalf.filled"
        case 0.8..<1.0:
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
        
        facilityDescriptionLabel.font = .systemFont(ofSize: 14)
        facilityDescriptionLabel.numberOfLines = 1
        facilityDescriptionLabel.textColor = .darkGray
        facilityDescriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
}

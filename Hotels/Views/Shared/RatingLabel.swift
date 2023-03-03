//
//  RatingView.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 03/03/23.
//

import UIKit

class RatingLabel: UILabel {
    var ratingScore: Double = 0.0 {
        didSet {
            configure()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        let ratingImage = UIImage(named: "Star")
        let ratingAttachment = NSTextAttachment()
        ratingAttachment.image = ratingImage
        let ratingAttributeString = NSMutableAttributedString(attachment: ratingAttachment)
        
        let ratingScoreText = NSAttributedString(string: " \(ratingScore)")
        ratingAttributeString.append(ratingScoreText)
        
        self.attributedText = ratingAttributeString
        self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.font = .systemFont(ofSize: 16)
        self.adjustsFontSizeToFitWidth = true
    }
}

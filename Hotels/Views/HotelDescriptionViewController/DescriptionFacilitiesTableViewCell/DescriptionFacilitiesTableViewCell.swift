//
//  DescriptionFacilitiesTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class DescriptionFacilitiesTableViewCell: UITableViewCell {
    static let identifier = "DescriptionFacilitiesTableViewCell"
    
    @IBOutlet weak var hotelFacilitiesCollectionView: UICollectionView!
    
    var hotelFacilities: [Facility]?

    func setupCell(screenWidth: CGFloat) {
        hotelFacilitiesCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: screenWidth / 1.5, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        hotelFacilitiesCollectionView.collectionViewLayout = flowLayout
        hotelFacilitiesCollectionView.delegate = self
        hotelFacilitiesCollectionView.dataSource = self
        hotelFacilitiesCollectionView.register(UINib(nibName: FacilityCardCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: FacilityCardCollectionCell.identifier)
    }
}

extension DescriptionFacilitiesTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelFacilities?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let facilities = hotelFacilities, let facilityCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: FacilityCardCollectionCell.identifier, for: indexPath) as? FacilityCardCollectionCell else
        {return UICollectionViewCell()}
        
        facilityCardCell.setupCell(facility: facilities[indexPath.row])
        
        return facilityCardCell
    }
    
    
}



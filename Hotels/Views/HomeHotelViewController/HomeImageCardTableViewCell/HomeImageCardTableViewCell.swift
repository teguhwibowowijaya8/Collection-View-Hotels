//
//  HomeImageCardTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

protocol HomeImageCardTableViewDelegate {
    func onImageCardSelected(hotel: Hotel)
}

class HomeImageCardTableViewCell: UITableViewCell, UICollectionViewDelegate {
    static let identifier = "HomeImageCardTableViewCell"
    
    @IBOutlet weak var hotelImageCardsCollectionView: UICollectionView!
    
    var hotels: [Hotel]?
    
    var delegate: HomeImageCardTableViewDelegate?

    func setupCell(screenWidth: CGFloat) {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let screenWidth = UIScreen.main.bounds.width
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: screenWidth / 1.5, height: 180)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        flowLayout.minimumLineSpacing = 15
        
        hotelImageCardsCollectionView.collectionViewLayout = flowLayout
        hotelImageCardsCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        hotelImageCardsCollectionView.showsHorizontalScrollIndicator = false
        hotelImageCardsCollectionView.delegate = self
        hotelImageCardsCollectionView.dataSource = self
        hotelImageCardsCollectionView.register(UINib(nibName: HotelImageCardCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: HotelImageCardCollectionCell.identifier)
    }
    
}

extension HomeImageCardTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let hotels = hotels, let imageCardsCell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelImageCardCollectionCell.identifier, for: indexPath) as? HotelImageCardCollectionCell else {return UICollectionViewCell()}
        
        imageCardsCell.setupCell(hotel: hotels[indexPath.row])
        
        return imageCardsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onImageCardSelected(hotel: HotelData.hotels[indexPath.row])
    }
    
    
}

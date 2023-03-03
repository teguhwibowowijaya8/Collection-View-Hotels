//
//  HomeHotelViewController.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

enum HomeHotelViewSection {
    case header
    case imageSlideshow
    case hotelNearby
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .header
        case 1:
            self = .imageSlideshow
        case 2:
            self = .hotelNearby
        default:
            self = .header
        }
    }
}

class HomeHotelViewController: UIViewController {
    
    @IBOutlet weak var homeHotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupTableView() {
        homeHotelTableView.separatorStyle = .none
        homeHotelTableView.delegate = self
        homeHotelTableView.dataSource = self
        
        homeHotelTableView.register(UINib(nibName: HomeHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeHeaderTableViewCell.identifier)
        homeHotelTableView.register(UINib(nibName: HomeImageCardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeImageCardTableViewCell.identifier)
        homeHotelTableView.register(UINib(nibName: HotelCardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HotelCardTableViewCell.identifier)
    }
}

extension HomeHotelViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch HomeHotelViewSection(section) {
        case .hotelNearby:
            return HotelData.hotels.count / 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeHotelViewSection(indexPath.section) {
        case .header:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.identifier, for: indexPath) as? HomeHeaderTableViewCell else {return UITableViewCell()}
            
            headerCell.setupCell(titleLine1: "Discover Your", titleLine2: "Perfect Place to Stay")
            return headerCell
            
        case .imageSlideshow:
            guard let imageCardsCell = tableView.dequeueReusableCell(withIdentifier: HomeImageCardTableViewCell.identifier, for: indexPath) as? HomeImageCardTableViewCell else {return UITableViewCell()}
            
            imageCardsCell.hotels = HotelData.hotels
            imageCardsCell.delegate = self
            imageCardsCell.setupCell(screenWidth: view.bounds.width)
            return imageCardsCell
            
        case .hotelNearby:
            guard let hotelNearbyCell = tableView.dequeueReusableCell(withIdentifier: HotelCardTableViewCell.identifier, for: indexPath) as? HotelCardTableViewCell else {return UITableViewCell()}
            
            hotelNearbyCell.setupCell(hotel: HotelData.hotels[indexPath.row])
            
            return hotelNearbyCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let hotelDescriptionVC = storyboard.instantiateViewController(withIdentifier: HotelDescriptionViewController.identifier) as? HotelDescriptionViewController {
                hotelDescriptionVC.hotel = HotelData.hotels[indexPath.row]
                navigationController?.pushViewController(hotelDescriptionVC, animated: true)
            }
        }
    }
}

// MARK: Table View Header
extension HomeHotelViewController {
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        switch HomeHotelViewSection(section) {
        case .hotelNearby:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch HomeHotelViewSection(section) {
        case .hotelNearby:
            let neabyHeader = HomeHotelListHeaderView()
            neabyHeader.delegate = self
            neabyHeader.setupHeaderView()
            return neabyHeader
        default:
            return nil
        }
    }
}

extension HomeHotelViewController: HomeHotelListViewDelegate {
    func onShowAllButtonSelected() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let hotelListVC = storyboard.instantiateViewController(withIdentifier: HotelListViewController.identifier) as? HotelListViewController {
            self.navigationController?.pushViewController(hotelListVC, animated: true)
        }
    }
}

extension HomeHotelViewController: HomeImageCardTableViewDelegate {
    func onImageCardSelected(hotel: Hotel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let hotelDetailVC = storyboard.instantiateViewController(withIdentifier: HotelDescriptionViewController.identifier) as? HotelDescriptionViewController {
            hotelDetailVC.hotel = hotel
            self.navigationController?.pushViewController(hotelDetailVC, animated: true)
        }
    }
}

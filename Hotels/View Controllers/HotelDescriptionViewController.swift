//
//  HotelDescriptionViewController.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

enum HotelDescriptionViewSection: Int {
    case image
    case detail
    case facilities
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .image
        case 1:
            self = .detail
        case 2:
            self = .facilities
        default:
            self = .image
        }
    }
    
}

class HotelDescriptionViewController: UIViewController {
    static let identifier = "HotelDescriptionViewController"
    
    @IBOutlet weak var hotelDescriptionTableView: UITableView!
    
    var hotel: Hotel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hotel Detail"
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupTableView() {
        hotelDescriptionTableView.delegate = self
        hotelDescriptionTableView.dataSource = self
        
        hotelDescriptionTableView.register(UINib(nibName: DescriptionImageTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DescriptionImageTableViewCell.identifier)
        hotelDescriptionTableView.register(UINib(nibName: DescriptionDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DescriptionDetailTableViewCell.identifier)
        hotelDescriptionTableView.register(UINib(nibName: DescriptionFacilitiesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DescriptionFacilitiesTableViewCell.identifier)
    }
}

extension HotelDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let hotel = hotel else {return UITableViewCell()}
        switch HotelDescriptionViewSection(indexPath.section) {
        case .image:
            guard let descriptionImageCell = tableView.dequeueReusableCell(withIdentifier: DescriptionImageTableViewCell.identifier, for: indexPath) as? DescriptionImageTableViewCell else {return UITableViewCell()}
            
            descriptionImageCell.setupCell(imageName: hotel.imageName)
            
            return descriptionImageCell
            
        case .detail:
            guard let descriptionDetailCell = tableView.dequeueReusableCell(withIdentifier: DescriptionDetailTableViewCell.identifier, for: indexPath) as? DescriptionDetailTableViewCell else {return UITableViewCell()}
            
            descriptionDetailCell.setupCell(hotelName: hotel.name, hotelDescription: hotel.description)
            
            return descriptionDetailCell
            
        case .facilities:
            guard let descriptionFacilitiesCell = tableView.dequeueReusableCell(withIdentifier: DescriptionFacilitiesTableViewCell.identifier, for: indexPath) as? DescriptionFacilitiesTableViewCell else {return UITableViewCell()}
            
            descriptionFacilitiesCell.hotelFacilities = hotel.facilities
            descriptionFacilitiesCell.setupCell(screenWidth: UIScreen.main.bounds.width)
            
            return descriptionFacilitiesCell
        }
    }
    
    
}

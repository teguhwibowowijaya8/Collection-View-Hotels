//
//  HotelListViewController.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class HotelListViewController: UIViewController {
    static let identifier = "HotelListViewController"
    
    @IBOutlet weak var listHotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Hotel Nearby"
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupTableView() {
        listHotelTableView.separatorStyle = .none
        listHotelTableView.delegate = self
        listHotelTableView.dataSource = self
        
        listHotelTableView.register(UINib(nibName: HotelCardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HotelCardTableViewCell.identifier)
    }
}

extension HotelListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HotelData.hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let hotelCardCell = tableView.dequeueReusableCell(withIdentifier: HotelCardTableViewCell.identifier, for: indexPath) as? HotelCardTableViewCell else {return UITableViewCell()}
        
        hotelCardCell.setupCell(hotel: HotelData.hotels[indexPath.row])
        return hotelCardCell
    }
    
    
}

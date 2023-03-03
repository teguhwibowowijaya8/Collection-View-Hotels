//
//  HomeHotelListHeaderView.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

protocol HomeHotelListViewDelegate {
    func onShowAllButtonSelected()
}

class HomeHotelListHeaderView: UITableViewHeaderFooterView {
    var delegate: HomeHotelListViewDelegate?
    
    private lazy var headerTitleLabel: UILabel = {
        let headerTitleLabel = UILabel()
        headerTitleLabel.text = "Hotels Nearby"
        headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerTitleLabel
    }()
    
    private lazy var headerShowAllButton: UIButton = {
        let headerShowAllButton = UIButton(type: .system)
        headerShowAllButton.setTitle("Show All", for: .normal)
        headerShowAllButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
        headerShowAllButton.titleLabel?.text = "Show All"
        headerShowAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        headerShowAllButton.titleLabel?.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        headerShowAllButton.titleLabel?.textAlignment = .right
        headerShowAllButton.translatesAutoresizingMaskIntoConstraints = false
        return headerShowAllButton
    }()
    
    func setupHeaderView() {
        self.addSubview(headerTitleLabel)
        self.addSubview(headerShowAllButton)
        
        headerTitleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        headerShowAllButton.addTarget(self, action: #selector(onShowAllClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            headerTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            headerTitleLabel.rightAnchor.constraint(equalTo: headerShowAllButton.leftAnchor, constant: 20),
            
            headerShowAllButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerShowAllButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            headerShowAllButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func onShowAllClicked(_ sender: UIButton) {
        delegate?.onShowAllButtonSelected()
    }

}

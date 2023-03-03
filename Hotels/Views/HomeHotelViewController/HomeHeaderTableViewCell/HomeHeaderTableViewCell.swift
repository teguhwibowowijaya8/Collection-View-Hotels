//
//  HomeHeaderTableViewCell.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {
    static let identifier = "HomeHeaderTableViewCell"
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var searchHotelTextField: UITextField!
    
    private lazy var searchLeftView: UIView = {
        let searchLeftView = UIView()
        
        let leftImage = UIImage(systemName: "magnifyingglass")
        let leftImageView = UIImageView(image: leftImage)
        leftImageView.tintColor = .black
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        searchLeftView.addSubview(leftImageView)
        
        NSLayoutConstraint.activate([
            leftImageView.topAnchor.constraint(equalTo: searchLeftView.topAnchor, constant: 10),
            leftImageView.leftAnchor.constraint(equalTo: searchLeftView.leftAnchor, constant: 10),
            leftImageView.bottomAnchor.constraint(equalTo: searchLeftView.bottomAnchor, constant: -10),
            leftImageView.rightAnchor.constraint(equalTo: searchLeftView.rightAnchor, constant: -10),
            leftImageView.widthAnchor.constraint(equalToConstant: 20),
            leftImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return searchLeftView
    }()
    
    private lazy var searchRightView: UIView = {
        let searchRightView = UIView()
        searchRightView.translatesAutoresizingMaskIntoConstraints = false
        searchRightView.backgroundColor = .white
        searchRightView.layer.cornerRadius = 17.5
        searchRightView.tintColor = .black
        
        let rightImage = UIImage(named: "Sort")
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        searchRightView.addSubview(rightImageView)
        
        NSLayoutConstraint.activate([
            rightImageView.topAnchor.constraint(equalTo: searchRightView.topAnchor, constant: 10),
            rightImageView.leftAnchor.constraint(equalTo: searchRightView.leftAnchor, constant: 10),
            rightImageView.bottomAnchor.constraint(equalTo: searchRightView.bottomAnchor, constant: -10),
            rightImageView.rightAnchor.constraint(equalTo: searchRightView.rightAnchor, constant: -10),
            searchRightView.widthAnchor.constraint(equalToConstant: 35),
            searchRightView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        return searchRightView
    }()
    
    func setupCell(titleLine1: String, titleLine2: String) {
        let titleLine = NSMutableAttributedString(string: titleLine1, attributes: [
            .font: UIFont.systemFont(ofSize: 24)
        ])
        
        titleLine.append(NSAttributedString(string: "\n\(titleLine2)", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]))
        titleTextView.attributedText = titleLine
        
        setupSearchTextField()
    }
    
    func setupSearchTextField() {
        searchHotelTextField.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
        searchHotelTextField.placeholder = "Search hotel"
        searchHotelTextField.leftView = searchLeftView
        searchHotelTextField.leftViewMode = .always
        searchHotelTextField.layer.cornerRadius = 25
        searchHotelTextField.clipsToBounds = true
        
        let searchRightImageWrapper = UIView()
        searchRightImageWrapper.translatesAutoresizingMaskIntoConstraints = false
        searchRightImageWrapper.addSubview(searchRightView)
        
        NSLayoutConstraint.activate([
            searchRightView.topAnchor.constraint(equalTo: searchRightImageWrapper.topAnchor),
            searchRightView.bottomAnchor.constraint(equalTo: searchRightImageWrapper.bottomAnchor),
            searchRightView.rightAnchor.constraint(equalTo: searchRightImageWrapper.rightAnchor, constant: -10),
            searchRightView.leftAnchor.constraint(equalTo: searchRightImageWrapper.leftAnchor),
            
            searchHotelTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        searchHotelTextField.rightView = searchRightImageWrapper
        searchHotelTextField.rightViewMode = .always
    }
    
}

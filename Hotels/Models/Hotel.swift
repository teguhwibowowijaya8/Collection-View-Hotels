//
//  HotelModel.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import Foundation

struct Hotel {
    let imageName: String
    let name: String
    let price: Double
    let _rating: Double
    var rating: Double {
        if _rating > 5.0 { return 5.0 }
        else if _rating < 0.0 { return 0.0 }
        else { return _rating }
    }
    let address: String
    let description: String
    var facilities: [Facility]
    
    var priceString: String {
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        if let formattedPrice = formater.string(from: price as NSNumber) {
            return formattedPrice
        }
        return "$0.00"
    }
}

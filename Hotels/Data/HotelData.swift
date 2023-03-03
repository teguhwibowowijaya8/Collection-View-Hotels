//
//  HotelData.swift
//  Hotels
//
//  Created by Teguh Wibowo Wijaya on 02/03/23.
//

import Foundation

struct HotelData {
    static let hotels: [Hotel] = [
        Hotel(imageName: "Hotel", name: "Hotel Rodeo Rodeo Rodeo Rodeo", price: 200, _rating: 5.5, address: "211 Baker Street", description: description, facilities: facilities),
        Hotel(imageName: "Hotel", name: "Shangrilla Hotel", price: 300, _rating: 4.5, address: "211B Baker Street", description: description, facilities: facilities),
        Hotel(imageName: "Hotel", name: "Swiss Hotel", price: 350, _rating: 4.8, address: "211A Baker Street", description: description, facilities: facilities),
        Hotel(imageName: "Hotel", name: "Trivago Hotel", price: 100, _rating: 3.7, address: "Jl. Trivago Jakarta", description: description, facilities: facilities),
        Hotel(imageName: "Hotel", name: "French Hotel", price: 450, _rating: 5, address: "French Street", description: description, facilities: facilities)
    ]
    
    private static let description = """
Hotel mewah di ibu kota juga tak luput dari kisah mistis, salah satunya adalah Hotel Indonesia. Menurut kabar yang beredar, lantai 4 hotel ini menjadi pusat tinggal para penghuni tak kasat mata. Pengunjung mengaku kerap melihat sosok wanita cantik dengan gaun berwarna putih muncul di lorong depan lift.\n
Meski menyimpan kisah mistis, tetapi Hotel Indonesia tak pernah sepi pengunjung. Letaknya yang strategis yakni di kawasan Bundaran HI menjadi alasan utama hotel ini selalu menjadi favorit. Apalagi sarat sejarah dan fasilitasnya yang luar biasa wah.
"""
    
    private static let facilities: [Facility] = [
        Facility(imageName: "Hotel", name: "Main Bedroom", briefDescription: "Presidental Class - Delux", rating: 4.5),
        Facility(imageName: "Hotel", name: "Gym", briefDescription: "Presidental Class - Delux", rating: 3.5),
        Facility(imageName: "Hotel", name: "Shower Room", briefDescription: "Presidental Class - Delux", rating: 2.5),
        Facility(imageName: "Hotel", name: "Cabin", briefDescription: "Presidental Class - Delux", rating: 1.5),
        Facility(imageName: "Hotel", name: "Swimming Pool", briefDescription: "Presidental Class - Delux", rating: 0.5)
    ]
}

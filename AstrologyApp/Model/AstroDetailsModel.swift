//
//  AstroDetailsModel.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 26.10.2020.
//

import Foundation

struct AstroDetailsModel: Codable {
    let day: Int
    let month: Int
    let year: Int
    let hour: Int
    let min: Int
    let lat: Double
    let lon: Double
    let tzone: Double
    
    var dictionary: [String: Any] {
        return [
            "day": day,
            "month": month,
            "year" : year,
            "hour" : hour,
            "min" : min,
            "lat" : lat,
            "lon" : lon,
            "tzone" : tzone
           ]
       }
}

struct AstroDetailsResponseData: Codable {
    var ascendant, ascendant_lord, Varna, Vashya: String
    var Yoni, Gan, Nadi, SignLord: String
    var sign, Naksahtra, NaksahtraLord: String
    var Charan: Int
    var Yog, Karan, Tithi, yunja: String
    var tatva, name_alphabet, paya: String
}

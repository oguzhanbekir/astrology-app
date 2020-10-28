//
//  AstroDetailsViewModel.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 27.10.2020.
//

import Foundation

struct AstroDetailsViewModel {
    let astroDetails : AstroDetailsResponseData
    
    var ascendant : String {
        return self.astroDetails.ascendant
    }
    var sign : String {
        return self.astroDetails.sign
    }
}

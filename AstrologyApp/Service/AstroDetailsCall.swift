//
//  AstroDetailsCall.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 27.10.2020.
//

import Foundation

extension ViewController {

    func postAstroDetail(day: Int, month: Int, year: Int, hour: Int, min: Int, lat: Double, lon: Double, tzone: Double)
    {
        let token: String = AuthenticationConstant().base64LoginString
        let header = ["Authorization" : "Basic \(token)"]
        let bodyRegister = AstroDetailsModel(day:  day, month: month, year: year, hour: hour, min: min, lat: lat, lon: lon, tzone: tzone)

        NetworkCall(data: bodyRegister.dictionary, headers: header, service: .astroDetails, method: .post).executeQuery(){
                 (result: Result<AstroDetailsResponseData,Error>) in
                    switch result {
                    case .success(let response):
                        self.astroDetailViewModel = AstroDetailsViewModel(astroDetails: response)
                        self.performSegue(withIdentifier: "toResultVC", sender: self)
                    case .failure(let error):
                        self.alert(message: error.localizedDescription, title: "Error")
                    }
        }
    }
    
 
}

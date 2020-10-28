//
//  NetworkCall.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 26.10.2020.
//

import UIKit
import Alamofire

class NetworkCall : NSObject {
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var api_end_point :String! = "https://json.astrologyapi.com/v1/"
    var encoding: ParameterEncoding! = JSONEncoding.default
    
    enum apiName : String {
        case astroDetails = "astro_details"
    }
    
    init( data: [String:Any],headers: [String:String] = [:], service :apiName? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if service != nil{
            self.api_end_point += service!.rawValue
        }
        if !isJSONRequest {
            encoding = URLEncoding.default
        }
        self.method = method
    }


    
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(api_end_point,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch (response.result) {
                case .success:
                    if let data = response.data {
                        do {
                            let response = try JSONDecoder().decode(T.self, from: data)
                            completion(Result.success(response))
                        } catch {
                            print(String(data: data, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
}


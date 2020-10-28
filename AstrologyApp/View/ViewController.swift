//
//  ViewController.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 26.10.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var astroDetailViewModel : AstroDetailsViewModel!
    let geoCoder = CLGeocoder()
    let dateFormatter = DateFormatter()
    var timeZone : Double = 0.0
    var year: String = ""
    var month: String = ""
    var day: String = ""
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var minTF: UITextField!
    @IBOutlet weak var hourTF: UITextField!
    @IBOutlet weak var birthCityTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeZone = Double(TimeZone.current.secondsFromGMT()) / 3600.0
    }
    
    
    @IBAction func calculateClicked(_ sender: Any) {
        dateFormatter.dateFormat = "yyyy"
        year = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "MM"
        month = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "dd"
        day = dateFormatter.string(from: self.datePicker.date)

        if birthCityTF.text != nil && hourTF.text != nil && minTF.text != nil {
            getLocation(from: birthCityTF.text!) { (location) in
                self.postAstroDetail(day: Int(self.day)!, month: Int(self.month)!, year: Int(self.year)!, hour: Int(self.hourTF.text!)!, min: Int(self.minTF.text!)!, lat: Double((location?.coordinate.latitude)!), lon: Double((location?.coordinate.longitude)!), tzone: self.timeZone)
            }
        }
    }
    
    func getLocation(from address: String, completion: @escaping (_ location: CLLocation?)-> Void) {
        geoCoder.geocodeAddressString(birthCityTF.text!) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                self.alert(message: "Please use real city name", title: "Error")
                return
            }
            completion(location)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let destinationVC = segue.destination as? ResultViewController
            destinationVC?.ascendantValue = self.astroDetailViewModel.ascendant
            destinationVC?.signValue = self.astroDetailViewModel.sign
        }
    }
}


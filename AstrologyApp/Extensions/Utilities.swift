//
//  Utilities.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 27.10.2020.
//

import UIKit

extension UIViewController {    
    func alert(message: String, title: String = "") {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
}

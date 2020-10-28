//
//  ResultViewController.swift
//  AstrologyApp
//
//  Created by Oguzhan Bekir on 27.10.2020.
//

import UIKit

class ResultViewController: UIViewController {
    var ascendantValue : String?
    var signValue : String?
    
    @IBOutlet weak var ascendantLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        ascendantLabel.text = ascendantValue
        signLabel.text = signValue
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  GratitudeViewController.swift
//  CarRental
//
//  Created by Павел Цыганов on 15.11.2021.
//

import UIKit

class GratitudeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateFromLabel: UILabel!
    @IBOutlet var dateBeforeLabel: UILabel!
    @IBOutlet var gratitudeTF: UILabel!
    

    var login: Login!
//    var car: Car!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(login.fullname), спасибо, что выбрали нашу компанию!"
        dateFromLabel.text = "Бронь с \(login.dateFrom) - "
        dateBeforeLabel.text = "по \(login.dateBefore)!"
//        gratitudeTF.text = car.model
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutUsVC = segue.destination as? AboutUsViewController else { return }
        aboutUsVC.login = login
    }
    
}





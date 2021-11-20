//
//  AboutUsViewController.swift
//  CarRental
//
//  Created by Павел Цыганов on 14.11.2021.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet var fullNameTF: UILabel!
    @IBOutlet var aboutUsImage: UIImageView!
    @IBOutlet var anotherAboutUsImage: UIImageView!
    @IBOutlet var aboutUsLabel: UILabel!
    @IBOutlet var anotherAboutUsLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    var login: Login!
//    var car: Car!
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTF.text = "Мы ждем Вас \(login.fullname)"
        aboutUsImage.layer.cornerRadius = aboutUsImage.frame.size.width / 2
        anotherAboutUsImage.layer.cornerRadius = anotherAboutUsImage.frame.size.width / 2
//        aboutUsImage.image = UIImage(car.image)
//        anotherAboutUsImage.image = UIImage(car.anotherImage)
//        aboutUsLabel.text = String(car.aboutUsPerson)
//        anotherAboutUsLabel.text = String(car.anotherAboutUsPerson)
//        addressLabel.text = String(car.address)
//        emailLabel.text = String(car.email)
//        phoneLabel.text = String(car.phone)
    }
   
}


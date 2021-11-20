//
//  DetailViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 16.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ImageViewCar: UIImageView!
    @IBOutlet var carNameLabel: UILabel!
    @IBOutlet var descriptionCar: UILabel!
    @IBOutlet var priceCar: UILabel!
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageViewCar.image = UIImage(named: car.car)
        carNameLabel.text = car.car
        descriptionCar.text = "Коробка \(car.transmission),\n привод \(car.driveUnit),\n объем двигателя \(car.engine),\n лошадиных сил \(car.horsePower)"
        priceCar.text = "Цена - \(car.price)  в сутки"
    }
}

//
//  DetailCarViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 22.11.2021.
//

import UIKit

class DetailCarViewController: UIViewController {

    @IBOutlet var imageCar: UIImageView!
    @IBOutlet var carNameLabel: UILabel!
    @IBOutlet var carDescriptionLabel: UILabel!
    @IBOutlet var carPriceLabel: UILabel!
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCar.image = UIImage(named: car.image)
        carNameLabel.text = car.carNames
        carDescriptionLabel.text = "Данный автомобиль имеет \(car.driveUnits) привод. \n\(car.horsesPower) лошадиных сил. \nДвигатель \(car.engine) л. \nКоробка передач \(car.transmission)"
        carPriceLabel.text = "Цена: \(car.price) в сутки"
        
    }
    
    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let reserveVC = segue.destination as? ReserveViewController else { return }
//        reserveVC.car = car
//    }
}

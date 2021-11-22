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
        carNameLabel.text = car.name
        carDescriptionLabel.text = "Данный автомобиль имеет \(car.driveUnits) привод. \n\(car.horsesPower) лошадиных сил. \nДвигатель \(car.engine) л. \nКоробка передач \(car.transmission)"
        carPriceLabel.text = "Цена: \(car.price) в сутки"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

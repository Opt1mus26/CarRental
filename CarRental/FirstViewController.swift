//
//  FirstViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 22.11.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    private var carsList = Car.getCarList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerImage.image = UIImage(named: "BMW X1")
        textLabel.text = "Позвольте найти для вас идеальный автомобиль. \n \n Подберем на любой вкус и кошелек, продолжительность проката от 1 часа до нескольких месяцев! \n \n Бронируйте прямо в приложении"
    }
}

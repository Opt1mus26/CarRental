//
//  FirstViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 18.11.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: car.car)
        
    }
}

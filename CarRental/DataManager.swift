//
//  DataManager.swift
//  CarRental
//
//  Created by Alisa Ts on 15.11.2021.
//

class DataManager {
    static let shared = DataManager()
    
    let cars = ["Daewoo Matiz", "Hyundai Getz", "Kia Rio", "Hyundai Solaris",
                "Chevrolet Aveo", "Hyundai Elantra", "Kia Ceed", "Kia Cerato",
                "Ford Mondeo", "Honda Accord", "Hyundai Sonata", "Toyota Camry",
                "Hyundai Creta", "BMW X1", "Kia Sorento"]
    
    let prices = ["2000", "2500","5000","5000","5000","7000","7000",
                 "7000","8500","8500","8500","12000","15000","15000","15000"]
    
    let horsesPower = ["52", "97","123","123","115","132","129",
                      "130","140","190","150","249","149","184","180"]
    
    let driveUnits = ["передний", "передний", "передний", "передний", "передний",
                     "передний", "передний", "передний", "передний", "передний",
                     "передний", "передний", "передний", "полный", "полный"]
    
    let transmissions = ["механическая", "механическая", "автомат", "автомат",
                        "автомат", "автомат", "автомат", "механическая", "автомат",
                        "автомат", "автомат", "автомат", "автомат", "автомат", "автомат"]
    
    let engines = ["0.8", "1.4","1.6","1.6","1.6","1.6","1.6",
                  "1.6","2.0","2.4","2.0","3.5","2.0","2.0","2.5"]
    
    private init() {}
}


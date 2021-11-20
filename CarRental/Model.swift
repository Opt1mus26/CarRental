//
//  Model.swift
//  CarRental
//
//  Created by Alisa Ts on 15.11.2021.
//

import Foundation

struct Car {
    let car: String
    let price: String
    let horsePower: String
    let driveUnit: String
    let transmission: String
    let engine: String
    let image: String
}

extension Car {
    static func getCarList() -> [Car] {
        
        var auto: [Car] = []
        
        let cars = DataManager.shared.cars
        let prices = DataManager.shared.prices
        let horsesPower = DataManager.shared.horsesPower
        let driveUnits = DataManager.shared.driveUnits
        let transmissions = DataManager.shared.transmissions
        let engines = DataManager.shared.engines
        
        for index in 0...14 {
            let car = Car(car: cars[index],
                          price: prices[index],
                          horsePower: horsesPower[index],
                          driveUnit: driveUnits[index],
                          transmission: transmissions[index],
                          engine: engines[index]
            )
            
            auto.append(car)
        }
        
        return auto
    }
}

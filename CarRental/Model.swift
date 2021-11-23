//
//  Model.swift
//  CarRental
//
//  Created by Alisa Ts on 15.11.2021.
//

struct Car {
    let carNames: String
    let price: String
    let horsesPower: String
    let driveUnits: String
    let transmission: String
    let engine: String
    
    var image: String {
        "\(carNames)"
    }
}

extension Car {
    static func getCarList() -> [Car] {
        var cars: [Car] = []
        
        let carNames = DataManager.shared.cars
        let prices = DataManager.shared.prices
        let horsesPowers = DataManager.shared.horsesPower
        let drivesUnits = DataManager.shared.driveUnits
        let transmissions = DataManager.shared.transmissions
        let engines = DataManager.shared.engines
        
        for index in 0...14 {
            let car = Car(carNames: carNames[index],
                          price: prices[index],
                          horsesPower: horsesPowers[index],
                          driveUnits: drivesUnits[index],
                          transmission: transmissions[index],
                          engine: engines[index])
            cars.append(car)
        }
        return cars
    }
}

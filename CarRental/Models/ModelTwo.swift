//
//  Model.swift
//  CarRental
//
//  Created by Павел Цыганов on 17.11.2021.
//

import Foundation

struct Login {
    var name: String
    var lastName: String
    var dateFrom: String
    var dateBefore: String
    
    var fullname: String {
        "\(name) \(lastName)"
    }
}

struct AboutUs {
    var name: String
    var lastName: String
    var address: String
    var email: String
    var phone: String
    
    var fullName: String {
        "\(name) \(lastName)"
    }
}


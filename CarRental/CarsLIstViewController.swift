//
//  CarsLIstViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 15.11.2021.
//

import UIKit

class CarsLIstViewController: UITableViewController {
    
    var cars = Car.getCarList()
    private var filteredCars = [Car]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            filteredCars.count
        }
        
        if section == 0 {
            return 2
        } else if section == 1 || section == 2 {
            return 3
        } else if section == 3 || section == 4 {
           return 2
        } else {
            return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Class"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rental", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        var car: Car
        
        if isFiltering {
            car = filteredCars[indexPath.row]
        } else {
            car = cars[indexPath.row]
        }
//        let car = cars[indexPath.row]

        content.text = car.car
        content.secondaryText = "Стоимость: \(car.price) в сутки"
        content.image = UIImage(named: car.car)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        cell.contentConfiguration = content
    
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let car: Car
        if isFiltering {
            car = filteredCars[indexPath.row]
        } else {
            car = cars[indexPath.row]
        }
//        let car = cars[indexPath.row]
        detailVC.car = car
    }
}
extension CarsLIstViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterCarsforSearchText(searchController.searchBar.text!)
    }
    
    private func filterCarsforSearchText(_ searchText: String) {
        filteredCars = cars.filter({ (car: Car) -> Bool in
            return car.car.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}


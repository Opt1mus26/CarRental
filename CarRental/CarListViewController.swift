//
//  CarListViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 22.11.2021.
//

import UIKit

class CarListViewController: UITableViewController {

    private var carList = Car.getCarList()
    private var filterCars = [Car]()
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCars.count
        }
        return carList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rental", for: indexPath)
        
        var car: Car
        if isFiltering {
            car = filterCars[indexPath.row]
        } else {
            car = carList[indexPath.row]
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = car.name
        content.secondaryText = " Цена \(car.price) в сутки"
        content.image = UIImage(named: car.name)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        
        cell.contentConfiguration = content     

        return cell
    }
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailCarViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let car: Car
        
        if isFiltering {
            car = filterCars[indexPath.row]
        } else {
            car = carList[indexPath.row]
        }
        detailVC.car = car
    }
}
extension CarListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filterCars = carList.filter({ (car: Car) -> Bool in
            return car.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}

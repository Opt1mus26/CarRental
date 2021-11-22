//
//  CarListViewController.swift
//  CarRental
//
//  Created by Alisa Ts on 22.11.2021.
//

import UIKit

class CarListViewController: UITableViewController {

    private var carList = Car.getCarList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rental", for: indexPath)
        let car = carList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = car.name
        content.secondaryText = " Цена \(car.price) в сутки"
        content.image = UIImage(named: car.name)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        
        cell.contentConfiguration = content     

        return cell
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}

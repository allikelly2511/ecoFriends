//
//  ProfileViewController.swift
//  ecoFriends
//
//  Created by  on 2/6/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var typeOfPlants: UISegmentedControl!
    @IBOutlet var typeOfPlantsLabel: UILabel!
    @IBOutlet var tableViewYeah: UITableView!
    var selectedIndex = 0
    var lifestyleChangesArray = ["Go Vegan", "Switch to renewable energy", "Buy an electric car"]
    var pollutionArray = ["Use a reusable straw", "Bring reusable bags to the store"]
    var pollutionArrayPoints = [1, 3]
    var energyArray = ["Walk instead of driving", "Take Public transit", "Carpool"]
    var energyArrayPoints = [10, 5, 3]
    var wasteArray = ["Buy an item in bulk", "Use a reusable mug"]
    var wasteArrayPoints = [1, 3]
    var plantImages = [UIImage(named: "cactus"), UIImage(named: "funPlant"), UIImage(named: "emptyPot")]
    var plantProgress = [0.25, 0.75, 0.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (selectedIndex == 3){
            return(lifestyleChangesArray.count)
        }else if (selectedIndex == 0){
            return(wasteArray.count)
        }else if (selectedIndex == 1){
            return(pollutionArray.count)
        }else{
            return(energyArray.count)
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (selectedIndex == 3){
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "majorLifeChangesCell")
            cell.textLabel?.text = lifestyleChangesArray[indexPath.row]
            return(cell)
        }else if (selectedIndex == 0){
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "otherCategoriesCell")
            cell.textLabel?.text = wasteArray[indexPath.row]
            let xNSNumber = wasteArrayPoints[indexPath.row] as NSNumber
            let xString : String = xNSNumber.stringValue
            cell.detailTextLabel?.text = "+ " + xString
            return(cell)
        }else if (selectedIndex == 1){
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "otherCategoriesCell")
            cell.textLabel?.text = pollutionArray[indexPath.row]
            let xNSNumber = pollutionArrayPoints[indexPath.row] as NSNumber
            let xString : String = xNSNumber.stringValue
            cell.detailTextLabel?.text = "+ " + xString
            return(cell)
        }else{
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "otherCategoriesCell")
            cell.textLabel?.text = energyArray[indexPath.row]
            let xNSNumber = energyArrayPoints[indexPath.row] as NSNumber
            let xString : String = xNSNumber.stringValue
            cell.detailTextLabel?.text = "+ " + xString
            return(cell)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (selectedIndex == 3){
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    @IBAction func typeOfPlantsTapped(_ sender: UISegmentedControl) {
        if typeOfPlants.selectedSegmentIndex == 0{
            typeOfPlantsLabel.text = "Waste Reduction"
            selectedIndex = 0
        }else if typeOfPlants.selectedSegmentIndex == 1{
            typeOfPlantsLabel.text = "Pollution Reduction"
            selectedIndex = 1
        }else if typeOfPlants.selectedSegmentIndex == 2{
            typeOfPlantsLabel.text = "Energy Conservation"
            selectedIndex = 2
        }else if typeOfPlants.selectedSegmentIndex == 3{
            typeOfPlantsLabel.text = "Lifestyle Changes"
            selectedIndex = 3
        }
        tableViewYeah.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.currentPlantImage.image = plantImages[indexPath.item]
        cell.plantProgress.progress = Float(plantProgress[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
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

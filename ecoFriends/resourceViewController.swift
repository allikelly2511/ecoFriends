//
//  resourceViewController.swift
//  ecoFriends
//
//  Created by  on 3/5/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class resourceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let titleArray = ["Recycling 101", "How to Compost", "7 No Trace Principle", "Easy Eco-Friendly Food Substitutions"]
    let subtitleArray = ["Ironing out all your recycling misconceptions", "It's not that hard, and it's a great solution to food waste", "How to be the least destructive when hiking", "Easy diet switched the Mother Nature will thank you for"]
    let imageArray = [UIImage(named: "recycling"), UIImage(named: "compost"), UIImage(named: "leaveNoTrace"), UIImage(named: "diet")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titleArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "resourceCell")
                cell.textLabel?.text = titleArray[indexPath.row]
                cell.detailTextLabel?.text = subtitleArray[indexPath.row]
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                //cell.largeContentImage = imageArray[indexPath.row]
        return(cell)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
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

//
//  resourceViewController.swift
//  ecoFriends
//
//  Created by  on 3/5/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class resourceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    let titleArray = ["Recycling 101", "How to Compost", "7 No Trace Principle", "Easy Eco-Friendly Food Substitutions"]
    let subtitleArray = ["Ironing out all your recycling misconceptions", "It's not that hard, and it's a great solution to food waste", "How to be the least destructive when hiking", "Easy diet switched the Mother Nature will thank you for"]
    let imageArray = [UIImage(named: "recycling"), UIImage(named: "compost"), UIImage(named: "leaveNoTrace"), UIImage(named: "diet")]
    
    let websiteURLsArray = [URL(string: "https://recyclingsimplified.com/recycling-basics/"), URL(string: "https://learn.eartheasy.com/guides/composting/"), URL(string: "https://www.rei.com/learn/expert-advice/leave-no-trace.html"), URL(string: "https://www.onegreenplanet.org/animalsandnature/top-10-eco-friendly-foods/")]
//"https://recyclingsimplified.com/recycling-basics/", "https://learn.eartheasy.com/guides/composting/", "https://www.rei.com/learn/expert-advice/leave-no-trace.html", "https://www.onegreenplanet.org/animalsandnature/top-10-eco-friendly-foods/"
    
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
            //cell.imageView?.image = imageArray[indexPath.row]
            return(cell)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "resourcesDetailViewController") as? resourcesDetailViewController
        vc?.website = websiteURLsArray[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
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

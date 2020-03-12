//
//  resourcesDetailViewController.swift
//  ecoFriends
//
//  Created by  on 3/11/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit
import WebKit

class resourcesDetailViewController: UIViewController {

    @IBOutlet var resourcesWebView: WKWebView!
    
    var website = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: website!)
        resourcesWebView.load(request)
        // Do any additional setup after loading the view.
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

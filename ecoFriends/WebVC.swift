//
//  WebVC.swift
//  ecoFriends
//
//  Created by  on 1/31/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet var treeHuggerPage: WKWebView!
    let myUrl = URL(string: "https://www.treehugger.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: myUrl!)
        treeHuggerPage.load(request)
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

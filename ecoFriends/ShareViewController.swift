//
//  ShareViewController.swift
//  ecoFriends
//
//  Created by  on 2/6/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    let sharingImage = #imageLiteral(resourceName: "cactus")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareToInstaStories(_ sender: Any) {
        if let storiesURL = URL(string: "instagram-stories://share"){
            if UIApplication.shared.canOpenURL(storiesURL){
                guard let image = UIImage(named: "cactus") else { return }
                guard let imageData = image.pngData() else { return }
                let pasteboardItems: [String : Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#81ecec",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#81ecec"
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storiesURL, options: [:], completionHandler: nil)
                
            }else{
                print("User doesn't have Instagram on their device.")
            }
        }
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

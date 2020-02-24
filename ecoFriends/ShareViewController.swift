//
//  ShareViewController.swift
//  ecoFriends
//
//  Created by  on 2/6/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit
import MessageUI

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

}

extension ShareViewController: MFMessageComposeViewControllerDelegate{

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }

    @IBAction func sendMessage(_ sender: Any){
        if MFMessageComposeViewController.canSendText(){
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Check out this new plant I grew on ecoFriends by being environmentally friendly. Join me at: www.ecofriends.com/"
            if let imageData = UIImage(named: "funPlant")?.pngData(){
                messageVC.addAttachmentData(imageData, typeIdentifier: "public.data", filename: "funPlant.png")
            }
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: true, completion: nil)
        } else {
            print("Message couldn't be sent")
        }
    }
}

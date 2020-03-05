//
//  ReachOutViewController.swift
//  ecoFriends
//
//  Created by  on 2/6/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit
import MessageUI

class ReachOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func representativesButtonTapped(_ sender: Any) {
        showMailComposer(recipient: "allikelly2511@icloud.com", subject: "We need change now!", message: "As a new voter, I am prioritizing the environment when chosing canidates in the next election. I urge you to vote for this bill that bans illegal dumping and imposes heavy fines")
    }
    
    
    
    @IBAction func expertsButtonTapped(_ sender: Any) {
    
        showMailComposer(recipient: "allikelly2511@icloud.com", subject: "Environmental Research", message: "I saw you had extensive research on the impact of driving on the environment. I was wondering if you could elaborate on what I, as a non-driving High School student, could do to combat the issue")
    
    }
    
    func showMailComposer(recipient: String, subject: String, message: String){
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients([recipient])
        composer.setSubject(subject)
        composer.setMessageBody(message, isHTML: false)
        
        present(composer, animated: true)
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

extension ReachOutViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email sent")
        default:
            print("Error")
        }
        
        controller.dismiss(animated: true)
    }
}

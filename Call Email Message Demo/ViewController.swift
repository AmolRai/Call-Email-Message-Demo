//
//  ViewController.swift
//  Call Email Message Demo
//
//  Created by Amol Rai on 06/12/19.
//  Copyright © 2019 Amol Rai. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func emailMeButtonPressed(_ sender: UIButton) {
        
        guard MFMailComposeViewController.canSendMail() else {
            print("Device is not capable to send email")
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setSubject("Hello World")
        composer.setToRecipients(["amolrai3@gmail.com"])
        present(composer, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .saved:
            print("Saved")
        case .sent:
            print("Mail is sent")
        default:
            print("UNKNOWN")
        }
        
        controller.dismiss(animated: true)
    }

    @IBAction func callMeButtonPressed(_ sender: UIButton) {
        guard let url = URL(string: "TEL://123456789") else { return }
        UIApplication.shared.open(url, options: [:])
    }
    
    @IBAction func messageMeButtonPressed(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else {
            print("Device is not capable to send email")
            return
        }
        let composer = MFMessageComposeViewController()
        composer.messageComposeDelegate = self
        composer.subject = "Hello World"
        composer.recipients = ["123456789"]
        present(composer, animated: true)

    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .sent:
            print("Mail is sent")
        default:
            print("UNKNOWN")
        }

        controller.dismiss(animated: true)
    }

}

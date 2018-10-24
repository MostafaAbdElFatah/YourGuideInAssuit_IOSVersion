//
//  ViewController.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/23/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit
import MessageUI

class DetailsViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    var placeInfo:Place.PlaceData!
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placePhone: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeName.text = placeInfo.Name
        placeAddress.text = placeInfo.Address
        placePhone.text = placeInfo.Phone
    }

    
    @IBAction func callingTabed(_ sender: UIButton) {
        UIView.transition(
            with: sender
            , duration: 0.5
            , options: [.transitionFlipFromLeft]
            , animations: nil
            , completion: nil
        )

        let phones =  self.placeInfo.Phone.split(separator: "/")
        if phones.count == 1  {
            self.callPhone(phone: "\( phones[0] )")
        } else if phones.count > 1  {
            let alert = UIAlertController(title: "Calling", message: "Select the phone number", preferredStyle: UIAlertControllerStyle.actionSheet)
            for item in phones {
                alert.addAction(UIAlertAction(title: "\(item)", style: UIAlertActionStyle.destructive, handler: { (alertAction) in
                    self.callPhone(phone: "\(item)")
                }))
            }
            self.present(alert, animated: true, completion: nil)

        }
        
        
    }
    
    @IBAction func smsTabed(_ sender: UIButton) {
        UIView.transition(
            with: sender
            , duration: 0.5
            , options: [.transitionFlipFromLeft]
            , animations: nil
            , completion: nil
        )
        
        // send sms message
        let phones =  self.placeInfo.Phone.split(separator: "/")
        if phones.count == 1  {
            self.sendSMS(phone: "\( phones[0] )")
        } else if phones.count > 1  {
            let alert = UIAlertController(title: "Calling", message: "Select the phone number", preferredStyle: UIAlertControllerStyle.actionSheet)
            for item in phones {
                alert.addAction(UIAlertAction(title: "\(item)", style: UIAlertActionStyle.destructive, handler: { (alertAction) in
                    self.sendSMS(phone: "\(item)" )
                }))
            }
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func sendSMS(phone:String) {
        if MFMessageComposeViewController.canSendText(){
            let message = MFMessageComposeViewController()
            message.messageComposeDelegate = self
            message.recipients = ["\(phone)"]
            message.body = "message body"
            present(message, animated: true)
        }else {
            // show failure alert
            print("can't send message now")
        }
    }
    
    func callPhone (phone:String){
        guard let number = URL(string: "tel://" + phone ) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result.rawValue{
        case MessageComposeResult.sent.rawValue:
            print("Message sent..")
        case MessageComposeResult.cancelled.rawValue:
            print("Message cancelled..")
        case MessageComposeResult.failed.rawValue:
            print("Message failed..")
        default:
            print("no message Action.")
        }
        controller.dismiss(animated: true, completion: nil)
    }
        
}


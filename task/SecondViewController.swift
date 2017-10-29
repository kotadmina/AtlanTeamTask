//
//  SecondViewController.swift
//  task
//
//  Created by Sher Locked on 22.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var firstLabelCenter: NSLayoutConstraint!
    @IBOutlet weak var secondLabelCenter: NSLayoutConstraint!
    @IBOutlet weak var thirdLabelCenter: NSLayoutConstraint!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = Contacts.name
        emailLabel.text = Contacts.email
        phoneLabel.text = Contacts.phone
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.firstLabelCenter.isActive = true
        animate {
            self.secondLabelCenter.isActive = true
            self.animate {
                self.thirdLabelCenter.isActive = true
                self.animate { }
            }
        }
    }

    private func animate(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            completion()
        })
    }
    
    @IBAction func emailLabelPressed(_ sender: UITapGestureRecognizer) {
        let mailVC = createMailComposeVc()
        self.present(mailVC, animated: true, completion: nil)
    }
    
    @IBAction func phoneLabelPressed(_ sender: UITapGestureRecognizer) {
        let number = Contacts.phone.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: "tel://" + number) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func createMailComposeVc() -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients([Contacts.email])
        vc.mailComposeDelegate = self
        return vc
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}


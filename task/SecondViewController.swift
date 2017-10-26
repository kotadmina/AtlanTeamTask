//
//  SecondViewController.swift
//  task
//
//  Created by Sher Locked on 22.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var firstLabelCenter: NSLayoutConstraint!
    @IBOutlet weak var secondLabelCenter: NSLayoutConstraint!
    @IBOutlet weak var thirdLabelCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}


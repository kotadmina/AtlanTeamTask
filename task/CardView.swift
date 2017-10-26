//
//  CardView.swift
//  task
//
//  Created by Sher Locked on 23.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class CardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCard()
    }
    
    private func configureCard() {
        
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.5
    }
    
}

//
//  UsersCardView.swift
//  task
//
//  Created by Sher Locked on 24.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class UsersCardView: CardView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    weak var delegate: UsersCardViewDelegate?
    
    class func instanceFromNib() -> UsersCardView {
        let view = UINib(nibName: "UsersCardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UsersCardView
        return view        
    }
    
    func initLoading() {
        delegate?.updateViewWithUsers(view: self)
    }
    
    func configure(with viewModel: UsersCardViewModel) {
        for (i, subview) in stackView.subviews.enumerated() {
            let nameLabel = subview.viewWithTag(1) as? UILabel
            nameLabel?.text = textFromArray(viewModel.name, index: i)
            let usernameLabel = subview.viewWithTag(2) as? UILabel
            usernameLabel?.text = textFromArray(viewModel.username, index: i)
        }
    }
    
    private func textFromArray(_ array: [String?], index: Int) -> String? {
        guard array.count > index else {
            return nil
        }
        return array[index]
    }

    
}

//
//  CommentsCardView.swift
//  task
//
//  Created by Sher Locked on 24.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class CommentsCardView: CardView {

    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: CommentsCardViewDelegate?
    
    class func instanceFromNib() -> CommentsCardView {
        let view = UINib(nibName: "CommentsCardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CommentsCardView
        return view
    }
    
    
    @IBAction func getButtonPressed(_ sender: Any) {
        let commentId = textField.text ?? ""
        delegate?.updateViewWithComment(view: self, commentId: commentId)
    }
    
    func configure(with viewModel: CommentsCardViewModel) {
        self.commentsLabel.text = viewModel.body
    }
}

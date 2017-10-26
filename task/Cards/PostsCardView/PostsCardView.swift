//
//  PostsCardView.swift
//  task
//
//  Created by Sher Locked on 23.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class PostsCardView: CardView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: PostCardViewDelegate?
    
    class func instanceFromNib() -> PostsCardView {
        let view  = UINib(nibName: "PostsCardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PostsCardView
        return view
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let postId = textField.text ?? ""
        delegate?.updateViewWithPost(view: self, postId: postId)
    }
    
    func configure(with viewModel: PostCardViewModel) {
        self.titleLabel.text = viewModel.title
        self.bodyLabel.text = viewModel.body
    }
}

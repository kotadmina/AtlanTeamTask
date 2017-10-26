//
//  TodoCardView.swift
//  task
//
//  Created by Sher Locked on 24.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class TodoCardView: CardView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    
    weak var delegate: TodoCardViewDelegate?
    
    class func instanceFromNib() -> TodoCardView {
        let view = UINib(nibName: "TodoCardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TodoCardView
        return view
    }

    func initLoading() {
        let todoId = String(arc4random_uniform(200) + 1)
        delegate?.updateViewWithTodo(view: self, commentId: todoId)
    }
    
    func configure(with viewModel: TodoCardViewModel) {
        self.titleLabel.text = viewModel.title
        if let completed = viewModel.completion {
            self.completionLabel.text = String(completed)
        } else {
            self.completionLabel.text = nil
        }
    }

}

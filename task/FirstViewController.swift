//
//  FirstViewController.swift
//  task
//
//  Created by Sher Locked on 22.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var cardHolderView: CardHolder!
    
    var cards: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = PostsCardView.instanceFromNib()
        view1.delegate = self
        let view2 = CommentsCardView.instanceFromNib()
        view2.delegate = self
        let view3 = PicturesCardView.instanceFromNib()
        view3.delegate = self
        let view4 = UsersCardView.instanceFromNib()
        view4.delegate = self
        view4.initLoading()
        let view5 = TodoCardView.instanceFromNib()
        view5.delegate = self
        view5.initLoading()
        self.cards = [view1, view2, view3, view4, view5]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if cardHolderView.cards.isEmpty {
            cardHolderView.cards = self.cards
        }
    }

    


}


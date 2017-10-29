//
//  CardHolder.swift
//  task
//
//  Created by Sher Locked on 23.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class CardHolder: UIView {

    var cards: [UIView] = [] {
        didSet {
            configureHeights()
            configureCards()
        }
    }
    
    var cardsPlaceholderHeight: CGFloat = 0
    var closedCardHeight: CGFloat = 0
    var openedCardHeight: CGFloat = 0
    var cardX: CGFloat = 10
    var cardWidth: CGFloat {
        return frame.width - 2 * cardX
    }
    
    var placeholderTopY: CGFloat {
        return frame.height - cardsPlaceholderHeight
    }
    
    var openedView: UIView?
    
    private func configureHeights() {
        
        guard cards.count > 0 else {
            cardsPlaceholderHeight = 0
            closedCardHeight = 0
            openedCardHeight = 0
            return
        }
        
        cardsPlaceholderHeight = self.frame.height / 2
        closedCardHeight = cardsPlaceholderHeight / CGFloat(cards.count)
        openedCardHeight = cardsPlaceholderHeight - 10
    }
    
    private func configureCards() {
        
        //remove old cards
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        //add new cards
        for (i, card) in self.cards.enumerated() {
            self.addSubview(card)
            let topY = placeholderTopY + CGFloat(i) * closedCardHeight
            card.tag = i
            card.frame = CGRect(x: cardX, y: topY, width: cardWidth, height: openedCardHeight)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(cardPressed(sender:)))
            card.addGestureRecognizer(gesture)
        }
    }
    
    @objc private func cardPressed(sender: UITapGestureRecognizer) {
        sender.view?.endEditing(true)
        if let previousOpenedView = openedView {
            let topY = placeholderTopY + CGFloat(previousOpenedView.tag) * closedCardHeight
            animateViewToY(view: previousOpenedView, y: topY)
            if previousOpenedView.tag == sender.view?.tag {
                openedView = nil
                return
            }
        }
    
        openedView = sender.view
        animateViewToY(view: sender.view, y: 0)
    }
    
    private func animateViewToY(view: UIView?, y: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            view?.frame.origin.y = y
        }
    }

}

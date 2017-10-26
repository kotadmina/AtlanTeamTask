//
//  PicturesCardView.swift
//  task
//
//  Created by Sher Locked on 24.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import UIKit

class PicturesCardView: CardView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: PicturesCardViewDelegate?
    
    class func instanceFromNib() -> PicturesCardView {
        let view = UINib(nibName: "PicturesCardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PicturesCardView
        return view
    }

    @IBAction func getButtonPressed(_ sender: Any) {
        let pictureId = textField.text ?? ""
        delegate?.updateViewWithPicture(view: self, pictureId: pictureId)
    }
    
    func configure(with viewModel: PicturesCardViewModel) {
        if let stringUrl = viewModel.url {
            let url = URL(string: stringUrl)!
            let data = try! Data(contentsOf: url, options: [])
            imageView.image = UIImage(data: data)
        } else {
            imageView.image = nil
        }
    }
}

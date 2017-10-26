//
//  PicturesCardViewDelegate.swift
//  task
//
//  Created by Sher Locked on 25.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import Foundation

protocol PicturesCardViewDelegate: class {
    func updateViewWithPicture(view: PicturesCardView, pictureId: String)
}

extension FirstViewController: PicturesCardViewDelegate {
    
    func updateViewWithPicture(view: PicturesCardView, pictureId: String) {
        let urlPath = "https://jsonplaceholder.typicode.com/photos/"
        let url = URL(string: urlPath.appending(pictureId))
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    DispatchQueue.main.async {
                        
                        let viewModel = PicturesCardViewModel(url: json?["url"] as? String)
                        view.configure(with: viewModel)
                    }
                } catch let error {
                    self.configurePictureError(error, view: view)
                }
            } else if let error = error {
                self.configurePictureError(error, view: view)
            }
            
        }
        
        task.resume()
    }
    
    func configurePictureError(_ error: Error, view: PicturesCardView) {
        DispatchQueue.main.async {
            let viewModel = PicturesCardViewModel(url: nil)
            view.configure(with: viewModel)
        }
        print(error.localizedDescription)
    }
    
}

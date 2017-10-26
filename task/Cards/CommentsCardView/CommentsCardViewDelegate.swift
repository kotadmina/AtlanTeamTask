//
//  CommentsCardViewDelegate.swift
//  task
//
//  Created by Sher Locked on 26.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import Foundation

protocol CommentsCardViewDelegate: class {
    func updateViewWithComment(view: CommentsCardView, commentId: String)
}

extension FirstViewController: CommentsCardViewDelegate {
    func updateViewWithComment(view: CommentsCardView, commentId: String) {
        let urlPath = "https://jsonplaceholder.typicode.com/comments/"
        let url = URL(string: urlPath.appending(commentId))
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    DispatchQueue.main.async {
                        
                        let viewModel = CommentsCardViewModel(body: json?["body"] as? String)
                        view.configure(with: viewModel)
                    }
                } catch let error {
                    self.configureCommentsError(error, view: view)
                }
            } else if let error = error {
                self.configureCommentsError(error, view: view)
            }
            
        }
        
        task.resume()
    }
    
    func configureCommentsError(_ error: Error, view: CommentsCardView) {
        DispatchQueue.main.async {
            let viewModel = CommentsCardViewModel(body: nil)
            view.configure(with: viewModel)
        }
        print(error.localizedDescription)
    }
}



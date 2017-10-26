//
//  PostCardViewDelegate.swift
//  task
//
//  Created by Sher Locked on 25.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import Foundation

protocol PostCardViewDelegate: class {
    func updateViewWithPost(view: PostsCardView, postId: String)
}

extension FirstViewController: PostCardViewDelegate {
    func updateViewWithPost(view: PostsCardView, postId: String) {
        let urlPath = "https://jsonplaceholder.typicode.com/posts/"
        let url = URL(string: urlPath.appending(postId))
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    DispatchQueue.main.async {
                        
                        let viewModel = PostCardViewModel(title: json?["title"] as? String,
                                                          body: json?["body"] as? String)
                        view.configure(with: viewModel)
                    }
                } catch let error {
                    self.configurePostError(error, view: view)
                }
            } else if let error = error {
                self.configurePostError(error, view: view)
            }
            
        }
        
        task.resume()
    }
    
    func configurePostError(_ error: Error, view: PostsCardView) {
        DispatchQueue.main.async {
            let viewModel = PostCardViewModel(title: nil,
                                              body: nil)
            view.configure(with: viewModel)
        }
        print(error.localizedDescription)
    }
}

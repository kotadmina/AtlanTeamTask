//
//  TodoCardViewDelegate.swift
//  task
//
//  Created by Sher Locked on 26.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import Foundation

protocol TodoCardViewDelegate: class {
    func updateViewWithTodo(view: TodoCardView, commentId: String)
}

extension FirstViewController: TodoCardViewDelegate {
    func updateViewWithTodo(view: TodoCardView, commentId: String) {
        let urlPath = "https://jsonplaceholder.typicode.com/todos/"
        let url = URL(string: urlPath.appending(commentId))
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    DispatchQueue.main.async {
                        
                        let viewModel = TodoCardViewModel(title: json?["title"] as? String,
                                                          completion: json?["completed"] as? Bool)
                        view.configure(with: viewModel)
                    }
                } catch let error {
                    self.configureTodoError(error, view: view)
                }
            } else if let error = error {
                self.configureTodoError(error, view: view)
            }
            
        }
        
        task.resume()
    }
    
    func configureTodoError(_ error: Error, view: TodoCardView) {
        DispatchQueue.main.async {
            let viewModel = TodoCardViewModel(title: nil,
                                              completion: nil)
            view.configure(with: viewModel)
        }
        print(error.localizedDescription)
    }
}

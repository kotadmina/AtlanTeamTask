//
//  UsersCardViewDelegate.swift
//  task
//
//  Created by Sher Locked on 26.10.17.
//  Copyright © 2017 sherlocked. All rights reserved.
//

import Foundation

protocol UsersCardViewDelegate: class {
    func updateViewWithUsers(view: UsersCardView)
}

extension FirstViewController: UsersCardViewDelegate {
    func updateViewWithUsers(view: UsersCardView) {
        let urlPath = "https://jsonplaceholder.typicode.com/users/"
        let url = URL(string: urlPath)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    DispatchQueue.main.async {
                        var names = [String?]()
                        var usernames = [String?]()
                        for element in json ?? [] {
                            names.append(element["name"] as? String)
                            usernames.append(element["username"] as? String)
                        }
                        let viewModel = UsersCardViewModel(name: names,
                                                           username: usernames)
                        view.configure(with: viewModel)
                    }
                } catch let error {
                    self.configureUsersError(error, view: view)
                }
            } else if let error = error {
                self.configureUsersError(error, view: view)
            }
            
        }
        
        task.resume()
    }
    
    func configureUsersError(_ error: Error, view: UsersCardView) {
        DispatchQueue.main.async {
            let viewModel = UsersCardViewModel(name: [],
                                               username: [])
            view.configure(with: viewModel)
        }
        print(error.localizedDescription)
    }
}

//
//  Data.swift
//  Accounts
//
//  Created by Apple on 31/07/21.
//

import SwiftUI

struct Post: Codable, Identifiable{
    let id = UUID()
    var title: String
    var body: String
}

class Api{
    func getPosts(completion: @escaping ([Post]) -> () ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // The ! at the end of url means that it cannot be empty, removing ! will show an error
        // _ means you do not care about that value
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async { // This is done to make the call async
                completion(posts)
            }
        }
        .resume()
    }
}

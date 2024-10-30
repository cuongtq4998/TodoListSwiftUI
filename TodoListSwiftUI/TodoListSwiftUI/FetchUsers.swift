//
//  FetchUsers.swift
//  TodoListSwiftUI
//
//  Created by cuongtran on 10/30/24.
//

import SwiftUI
class FetchUsers: ObservableObject {
    @Published var items: [User] = []
    
    struct APIPath {
        static let search = "https://api.github.com/search/users?q=cuongtq"
    }
    
    init() {
        
    }
    
    func loadData() {
        let url = URL(string: APIPath.search)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data else {
                    print("No data")
                    return
                }
                
                let decodedJson = try JSONDecoder()
                    .decode(UserResult.self, from: data)
                
                DispatchQueue.main.async {
                    self.items = decodedJson.items
                }
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

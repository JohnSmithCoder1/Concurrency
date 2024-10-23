//
//  APIService.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard
            let url = URL(string: urlString)
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                return
            }
            
            guard
                error == nil
            else {
                return
            }
            
            guard
                let data = data
            else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([User].self, from: data)
                completion(.success(decodedData))
            } catch {
                print("Error")
            }
        }
        .resume()
    }
}

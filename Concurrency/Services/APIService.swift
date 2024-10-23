//
//  APIService.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getUsers(completion: @escaping (Result<[User], APIError>) -> Void) {
        guard
            let url = URL(string: urlString)
        else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                completion(.failure(.invalidResponseStatus))
                return
            }
            
            guard
                error == nil
            else {
                completion(.failure(.dataTaskError))
                return
            }
            
            guard
                let data = data
            else {
                completion(.failure(.corruptData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([User].self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}

enum APIError: Error {
    case invalidURL, invalidResponseStatus, dataTaskError, corruptData, decodingError
}

//
//  APICaller.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 19.05.2022.
//

import Foundation

 class APICaller {
     
    public var isPaginating = false
    static let shared = APICaller()
    struct Constants {
        static let topHeadlinesURL = URL(string:  "https://gnews.io/api/v4/search?q=example&token=6c37bfdd1f82599774137b25eb8f9a09")
    }
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: {
            let originalData = [ "dd"
            ]
            let newData = [
                "aa"
            ]
            completion(.success(pagination ? newData : originalData ))
            if pagination {
                self.isPaginating = false
            }
        })
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping(Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String
    let url: String
    let image: String
    let publishedAt: String
}

struct Source: Codable{
    let name: String
}

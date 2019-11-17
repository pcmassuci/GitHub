//
//  SerchApi.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
typealias UsersResult = (users: Users?, error: String)
typealias UsersCompletion = (UsersResult) -> Void

protocol SearchApiProtocol {
    func getSearchResults(searchTerm: String, completion: @escaping UsersCompletion)
}

class SearchApi: SearchApiProtocol {
    private enum SearchUrlPath {
        static let users = "search/users"
    }
    
    private let baseApi: BaseApiProtocol
    
    var errorMessage = String()
    var users: Users?
    
    init(baseApi: BaseApiProtocol = BaseApi()) {
        self.baseApi = baseApi
    }
    
    func getSearchResults(searchTerm: String, completion: @escaping UsersCompletion) {
        baseApi.fetchResults(urlPath: SearchUrlPath.users, query: searchTerm) { dataUsers, _ in
            guard let dataUsers = dataUsers else {
                completion((nil, "deu ruim"))
                return
            }
            self.updateSearchResults(dataUsers)
            completion((self.users, self.errorMessage))
        }
    }
    
    private func updateSearchResults(_ data: Data) {
        users = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json )
            users = try JSONDecoder().decode(Users.self, from: data)
            
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
    }
}

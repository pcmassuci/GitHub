//
//  SearchManager.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol SearchManagerProtocol {
    func searchUsers(_ users: String, completion: @escaping UsersCompletion)
}

class SearchManager: SearchManagerProtocol {
    let searchApi: SearchApiProtocol
    
    init(searchApi: SearchApiProtocol = SearchApi()) {
        self.searchApi = searchApi
    }
    
    func searchUsers(_ users: String, completion: @escaping UsersCompletion) {
        searchApi.getSearchResults(searchTerm: users) { result in
            completion(result)
        }
    }
}

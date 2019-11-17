//
//  SearchViewModel.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    func findUser(_ user: String)
}

class SearchViewModel {
    
    let users = Bindable<Users?>(nil)
    
    private let manager: SearchManagerProtocol
    
    init(manager: SearchManagerProtocol = SearchManager()) {
        self.manager = manager
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    func findUser(_ user: String) {
        manager.searchUsers(user) { result in
            self.users.value = result.users
        }
    }
}

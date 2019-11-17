//
//  UserViewModel.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 15/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol UserViewModelProtocol {
    func findUser(_ user: String)
}

class UserViewModel {
    
    let users = Bindable<User?>(nil)
    
    private let manager: SearchManagerProtocol
    
    init(manager: SearchManagerProtocol = SearchManager()) {
        self.manager = manager
    }
}

extension UserViewModel: UserViewModelProtocol {
    func findUser(_ user: String) {
        manager.searchUsers(user) { (result) in
            self.users.value = result.users?.users?.first
        }
    }
}

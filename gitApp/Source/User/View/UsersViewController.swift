//
//  UsersViewController.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 15/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    private var viewModel: UserViewModelProtocol?
    
    static func instantiate(withViewModel viewModel: UserViewModelProtocol) -> UsersViewController {
        let viewController: UsersViewController = UIStoryboard.viewController(from: .user)
        viewController.viewModel = viewModel
        
        return viewController
    }
}

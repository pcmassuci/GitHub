//
//  SearchViewController.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, Identifiable {
 
    private var viewModel: SearchViewModelProtocol?
    
    static func instantiate(withViewModel viewModel: SearchViewModelProtocol) -> SearchViewController {
        let viewController: SearchViewController = UIStoryboard.viewController(from: .search)
        viewController.viewModel = viewModel
        
        return viewController 
    }
}

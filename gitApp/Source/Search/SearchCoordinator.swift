//
//  SearchCoordinator.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    var childCoordinators: [Coordinator]?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SearchViewModel()
        let searchViewController = SearchViewController.instantiate(withViewModel: viewModel)
        navigationController.pushViewController(searchViewController, animated: true)
    }
}

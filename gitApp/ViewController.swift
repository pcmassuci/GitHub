//
//  ViewController.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 13/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let baseApi = SearchApi()
        baseApi.getSearchResults(searchTerm: "pcm") { [weak self] users, error in
          print("__________-users-----------")
            print(users?.users?.count)
            print("-----errror-----")
        print(error )
        }
        
    }
}

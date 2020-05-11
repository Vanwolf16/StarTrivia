//
//  ViewController.swift
//  StarTrivia
//
//  Created by David Murillo on 5/10/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
    }


}


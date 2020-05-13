//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person:Person!
    let api = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeWorldUrl) { (homeworld) in
            if let homeworld = homeworld{
                self.setupUI(homeworld: homeworld)
            }
        }
    }
    
    func setupUI(homeworld:Homeworld){
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    

}

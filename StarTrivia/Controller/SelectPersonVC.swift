//
//  ViewController.swift
//  StarTrivia
//
//  Created by David Murillo on 5/10/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonUrlSession(id: random) { (person) in
            if let person = person{
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            }
        }
    }
    
}


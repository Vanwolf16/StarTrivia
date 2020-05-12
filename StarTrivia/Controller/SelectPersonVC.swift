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
    
    //Button Outlet
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehicleBtn: UIButton!
    @IBOutlet weak var starshipBtn: UIButton!
    @IBOutlet weak var filmBtn: UIButton!
    
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person{
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            }
        }
    }
    @IBAction func homeworldClicked(_ sender: Any) {
    }
    @IBAction func vehicleClicked(_ sender: Any) {
    }
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    @IBAction func filmsClicked(_ sender: Any) {
    }
    
    
    
}


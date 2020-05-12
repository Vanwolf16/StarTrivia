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
    var person:Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person{
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    //Setup the UI View and update it
    func setupView(person:Person){
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeWorldUrl.isEmpty
        vehicleBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipBtn.isEnabled = !person.starshipUrls.isEmpty
        filmBtn.isEnabled = !person.filmUrls.isEmpty
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.homeworld.rawValue:
            if let destination = segue.destination as? HomeWorldVC{
                destination.person = person
            }
        case Segue.vehicles.rawValue:
            if let desination = segue.destination as? VehiclesVC{
                desination.person = person
            }
        case Segue.starships.rawValue:
            if let desination = segue.destination as? StarShipsVC{
                desination.person = person
            }
        case Segue.films.rawValue:
            if let desination = segue.destination as? FilmsVC{
                desination.person = person
            }
        default:
            break
        }
        
        enum Segue:String{
            case homeworld = "toHomeWorld"
            case vehicles = "toVehicles"
            case starships = "toStarships"
            case films = "toFilms"
        }
        
        
    }
    
}


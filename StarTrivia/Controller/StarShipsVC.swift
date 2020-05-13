//
//  StarShipsVC.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class StarShipsVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    //Btn Outlet
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    
    var person:Person!
    let api = StarshipsApi()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starships.first else {return}
        getStarship(url: firstStarship)
    }
    
    func getStarship(url:String){
        api.getStarship(url: url) { (starship) in
            if let starship = starship{
                self.setupView(starship: starship)
            }
        }
      }
      
    func setupView(starship:StarShips){
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState(){
        
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false:true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        
        /*
        if currentVehicle == 0{
            previousBtn.isEnabled = false
        }else{
            previousBtn.isEnabled = true
        }
        
        if currentVehicle == vehicles.count - 1{
            nextBtn.isEnabled = false
        }else{
            nextBtn.isEnabled = true
        }
        */
        getStarship(url: starships[currentStarship])
        
    }
    
}

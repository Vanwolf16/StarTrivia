//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    
    //Btn Outlet
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person:Person!
    let api = VehicleApi()
    //For multiple URL
    var vehicles = [String]()
    
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else {return}
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url:String){
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle{
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle:Vehicles){
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    @IBAction func preivousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState(){
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false:true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
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
        getVehicle(url: vehicles[currentVehicle])
        
    }
    
}

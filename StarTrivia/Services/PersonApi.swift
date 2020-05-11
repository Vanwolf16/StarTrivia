//
//  PersonApi.swift
//  StarTrivia
//
//  Created by David Murillo on 5/10/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation
import UIKit

class PersonApi{
    func getRandomPersonUrlSession(){
       
        guard let url = URL(string: PERSON_URL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            //check if error is nil
            guard error == nil else{
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else {return}
            do{
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String:Any] else {return}
                print(json)
            }catch{
                debugPrint(error.localizedDescription)
                return
            }
        }
        
        task.resume()
    }
    
}

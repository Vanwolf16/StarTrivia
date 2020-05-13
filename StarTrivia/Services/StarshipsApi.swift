//
//  StarshipsApi.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation
import Alamofire

class StarshipsApi{
    func getStarship(url:String,completion:@escaping StarshipResponseCompletion){
          guard let url = URL(string: url) else {return}
          
          AF.request(url).responseJSON { (response) in
              if let error = response.error{
                  debugPrint(error.localizedDescription)
                  completion(nil)
                  return
              }
              
              guard let data = response.data else {return completion(nil)}
              
              let jsonDecoder = JSONDecoder()
              do{
                let starship = try jsonDecoder.decode(StarShips.self, from: data)
                  completion(starship)
              }catch{
                  debugPrint(error.localizedDescription)
                  completion(nil)
              }
              
          }
          
      }
}


//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldApi{
    func getHomeworld(url:String,completion:@escaping HomeWorldResponseCompletion){
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
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
}

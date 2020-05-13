//
//  FilmApi.swift
//  StarTrivia
//
//  Created by David Murillo on 5/13/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation
import Alamofire

class FilmApi{
    func getFilm(url:String,completion:@escaping FilmResponseCompletion){
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
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
}

//
//  Film.swift
//  StarTrivia
//
//  Created by David Murillo on 5/13/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation

struct Film:Codable{
    let title:String
    let episode:Int
    let crawl:String
    let director:String
    let producer:String
    let releaseDate:String
    
    enum CodingKeys:String,CodingKey {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseDate = "release_date"
    }
    
}

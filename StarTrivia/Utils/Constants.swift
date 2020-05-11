//
//  Constants.swift
//  StarTrivia
//
//  Created by David Murillo on 5/10/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation
import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

//URL
let URL_BASE = "https://swapi.dev/api/"
let PERSON_URL = URL_BASE + "people/"

//Closure
typealias PersonResponseCompletion = (Person?) -> Void

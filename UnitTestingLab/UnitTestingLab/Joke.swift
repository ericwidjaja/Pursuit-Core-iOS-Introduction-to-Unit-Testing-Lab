//
//  Joke.swift
//  UnitTestingLab
//
//  Created by Eric Widjaja on 8/29/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation
import UIKit

struct JokeWrapper: Codable {
    let allJokes: [Joke]
    
}

struct Joke: Codable {
    let setup: String
    let punchline: String
    
}

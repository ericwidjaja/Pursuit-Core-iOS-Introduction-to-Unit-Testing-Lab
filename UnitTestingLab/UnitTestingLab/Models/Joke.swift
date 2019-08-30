//
//  Joke.swift
//  UnitTestingLab
//
//  Created by Eric Widjaja on 8/29/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import Foundation
import UIKit

struct JokeArr: Codable {
    let setup: String
    let punchline: String
    static func getJokes(from data: Data) -> [JokeArr] {
        do {
            let joke = try JSONDecoder().decode([JokeArr].self, from: data)
            return joke
        } catch let decodeError {
            fatalError("could not decode info \(decodeError)")
            
        }
    }
}

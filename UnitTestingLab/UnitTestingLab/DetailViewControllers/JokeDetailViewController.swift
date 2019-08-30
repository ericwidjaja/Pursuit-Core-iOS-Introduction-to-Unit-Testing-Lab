//
//  JokeDetailViewController.swift
//  UnitTestingLab
//
//  Created by Eric Widjaja on 8/29/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {

    var chosenJoke: JokeArr!
        
    @IBOutlet weak var jokeLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp ()
    }
    func loadUp () {
        jokeLabel.text = chosenJoke.punchline
    }
}


//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Eric Widjaja on 8/29/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var jokeTable: UITableView!
    var funJoke = [JokeArr](){
        didSet {
            jokeTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTable.delegate = self
        jokeTable.dataSource = self
        loadData()
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "joke", ofType: "json") else {
            fatalError("coundn't find json file")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try
                Data(contentsOf: url)
            let jokeJson = try JokeArr.getJokes(from: data)
            funJoke = jokeJson
        }
        catch {
            print(error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokeDetailVC = segue.destination as? JokeDetailViewController else {
            fatalError("Unexpected segue")
        }
        guard let selectedIndexPath = jokeTable.indexPathForSelectedRow
            else { fatalError("No row selected") }
        jokeDetailVC.chosenJoke = funJoke[selectedIndexPath.row]
    }
}

extension JokeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funJoke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokeTable.dequeueReusableCell(withIdentifier: "funnyCell")
        cell?.textLabel?.text = funJoke[indexPath.row].setup
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

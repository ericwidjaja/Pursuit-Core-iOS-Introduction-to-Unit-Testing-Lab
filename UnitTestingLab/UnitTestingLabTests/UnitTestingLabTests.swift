//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Eric Widjaja on 8/29/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class UnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK - create func to obtain data from respective json file depending on name parameter
    private func getDataFromJSON(name: String) -> Data {
        guard let pathToData = Bundle.main.path(forResource: name, ofType: "json") else {
            fatalError("couldn't find JSON file called \(name).json")}
        
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("error")
        }
    }
    
    //Task 1 : Make sure data loaded and model is able to decode
    func testJokeDidLoad() {
        let data = getDataFromJSON(name: "joke")
        let newJoke = JokeArr.getJokes(from: data)
        XCTAssertTrue(newJoke.self != nil, "There was no object")
    }
    
    //To test if they are 10 jokes inside the array
    func testAllJokesCount() {
        let data = getDataFromJSON(name: "joke")
        let newJoke = JokeArr.getJokes(from: data)
        XCTAssertTrue(newJoke.count == 10 , "The array only has \(newJoke.count)")
    }
    //To test [JokeArr]'s properties have Strings
    func testJokesString() {
        let data = getDataFromJSON(name: "joke")
        let newJoke = JokeArr.getJokes(from: data)
        for i in 0..<newJoke.count {
            XCTAssertTrue(newJoke[i].punchline == newJoke[i].punchline.description, "\(newJoke[i].punchline) is NOT a String")
            XCTAssertTrue(newJoke[i].setup == newJoke[i].setup.description, "\(newJoke[i].setup) is NOT a String")
        }
    }

}

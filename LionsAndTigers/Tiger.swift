//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 30.03.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import Foundation
import UIKit

//JB : Here we setup our Struct's

struct Tiger {

    //JB : Adding some Properties to our Struct

    var age = 0 // var age:Int! - + default value helps :)
    var name = ""
    var breed = ""
    var image = UIImage(named:"") // required import of UIKit

    func chuff() {
            println("Tiger: Chuff Chuff")
    }


    func chuffANumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; chuff++ {
            self.chuff() //JB : Have to call function within same class with self. otherwise naming conflict
        }
    }


    func chuffANumberOfTimes (numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                self.chuff() //JB : Have to call function within same class with self. otherwise naming conflict
            }
            else {
                println("Tiger: purr purr")
            }
        }
    }

    //JB : Function to update age of tigers
    func ageInTigerYearsFromAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }

    //JB : Function to show a random fact
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))

        var randomFact:String

        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        return randomFact
    }
}
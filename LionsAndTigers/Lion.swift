//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 16.04.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import Foundation
import UIKit

//JB : Creating a class with several instances
class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""


    func roar() {
        println("Lion: Roar Roar")
    }


    func changeToAlphaMale() {
        //JB: Only accessible because this instance is part of a class ! ! ! 
        self.isAlphaMale = true
    }


    func randomFact() -> String {
        var randomFact:String

        if self.isAlphaMale {
            randomFact = "Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."
        }
        else {
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }

        return randomFact
    }
}
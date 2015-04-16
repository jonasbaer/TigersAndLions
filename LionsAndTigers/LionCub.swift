//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 16.04.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import Foundation

//JB : Creating a Subclass of - allowing access to all instances, functions of Lion "Super" / "Higher" Class
class LionCub: Lion {

    func rubLionCubsBelly() {
        println("LionCub: Snuggle and be happy")
    }

    //JB : Overriding a function of the Super Class
    override func roar() {
        //JB : Call of original function from Super Class first - super not using creates infinite loop
        super.roar()
        //JB : Then add below
        println("LionCub: Growl Growl")
    }

    override func randomFact() -> String {
        var randomFactString:String

        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
}
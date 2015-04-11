//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 30.03.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import UIKit

// Type of Class Tiger needed ! ! ! and declared here to ensure global accessibility
var myTigers:[Tiger] = []

// Created to make sure next() doesn't show up
var currentIndex = 0

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //JB : Variable which is of type Tiger - only locally available within the function
        var myTiger = Tiger() // Key to get access of instances of other class :)
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named:"BengalTiger.jpg")

        myTigers.append(myTiger)

        println("My tiger's name is \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")

        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed

        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")

        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")

        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")

        myTigers += [secondTiger, thirdTiger, fourthTiger]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {

        //JB : Ensure that the same tiger is not shown after tab on next...
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        currentIndex = randomIndex
        let tiger = myTigers[randomIndex]


//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        breedLabel.text = tiger.breed
//        ageLabel.text = ("\(tiger.age)")

        //JB : Build a nice fade animation after the tab on the next button
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {

                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed

            }, completion: {
                (finished: Bool) -> () in
            })
    }
}


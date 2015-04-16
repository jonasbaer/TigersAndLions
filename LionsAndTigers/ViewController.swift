//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 30.03.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Type of Class Tiger needed ! ! ! and declared here to ensure global accessibility
    var myTigers:[Tiger] = []

    // Created to make sure next() doesn't show up
    var currentIndex = 0

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //JB : !!! Variable which is of type Tiger - only locally available within the function
        var myTiger = Tiger() // Key to get access of instances of other class :)
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named:"BengalTiger.jpg")

        //JB : Call function to update age and return value
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)

        //JB : Fill in array with Elements above
        self.myTigers.append(myTiger)

        //JB : Call of function which is declared in Tiger.swift file
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)

//        println("My tiger's name is \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")

        //JB : Declaration for the first launch of the App
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()

        //JB : !!! Variable which is of type Tiger - only locally available within the function
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)

        //JB : Call two functions declared in class Tiger.swift
        secondTiger.chuff()

        //JB : !!! Variable which is of type Tiger - only locally available within the function
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        thirdTiger.chuff()

        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)

        //JB : !!! Variable which is of type Tiger - only locally available within the function
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        fourthTiger.chuff()

        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)

        self.myTigers += [secondTiger, thirdTiger, fourthTiger]

        //JB : Prints out all names of Tigers from the array
        for test in self.myTigers {
            println(test.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {

        //JB : Ensure that the same tiger is not shown after tab on next...
        var randomIndex:Int
        do {
            //JB : Creates a random number between 0 and the array length
            randomIndex = Int(arc4random_uniform(UInt32(self.myTigers.count)))
        } while self.currentIndex == randomIndex

        self.currentIndex = randomIndex
        let tiger = self.myTigers[randomIndex]

//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        breedLabel.text = tiger.breed
//        ageLabel.text = ("\(tiger.age)")

        //JB : Build a nice fade animation after the tab on the next button
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {

                //JB : tiger is declared above - let tiger = self.myTigers[randomIndex]
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()

            }, completion: {
                (finished: Bool) -> () in
            })
    }
}


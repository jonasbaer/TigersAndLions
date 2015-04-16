//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Jonas Baer on 30.03.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //JB : Type of Class Tiger needed ! ! ! and declared here to ensure global accessibility
    var myTigers:[Tiger] = []

    //JB : Used to store lion instance content from class Lion.swift
    var lions:[Lion] = []

    //JB : Dito for subclass instances
    var lionCubs:[LionCub] = []

    //JB : Create a Tuple with 2 elements
    var currentAnimal = (species: "Tiger", index: 0)

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

        //JB : Create instances of our class allowing accessing from here
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West Africa"

        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"

        lion.roar()
        lioness.roar()

        lion.changeToAlphaMale()
        println(lion.isAlphaMale)

        //JB : Fill in our global array
        self.lions += [lion, lioness]


        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true

        lionCub.roar()
        lionCub.rubLionCubsBelly()

        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false

        self.lionCubs += [lionCub, femaleLionCub]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }

    //JB : Update our Truple based on currentAnimal and change (!) to other one - incl. random function
    func updateAnimal() {
        switch self.currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }

    //JB : 
    func updateView() {

        //JB : Build a nice fade animation after the tab on the next button
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {

            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLabel.text = lionCub.randomFact()
            }

            self.randomFactLabel.hidden = false

            }, completion: {
                (finished: Bool) -> () in
        })

    }
}


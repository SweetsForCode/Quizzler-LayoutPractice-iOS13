//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Questions
//    let quiz = [
//        QA(question: "Luke turned to the dark side. ", answer: false),
//        QA(question: "Batman is Bruce Wayne", answer: true),
//        QA(question: "The Flash is fast", answer: true),
//        QA(question: "Kyber Crystals don't power a lightsaber", answer: false),
//        QA(question: "The Avatar has to master 3 elements", answer: false),
//        QA(question: "Majora destroyed termina in 3 days", answer: true),
//        QA(question: "Zelda is the boy in green.", answer: false)
//    ]
    
    let questions:[String:Bool] = ["Luke turned to the dark side. ": false,
                                   "Batman is Bruce Wayne": true,
                                   "The Flash is fast": true,
                                   "Kyber Crystals don't power a lightsaber": false,
                                   "The Avatar has to master 3 elements": false,
                                   "Majora destroyed termina in 3 days": true,
                                   "Zelda is the boy in green.": false]
    
    
    //MARK: IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentIndex: Int = 0
    var progress: Int = 0
    var totalProgress: Int = 0
    
    //Button Background Images
    let normalRectImg: UIImage = UIImage(imageLiteralResourceName: "Rectangle")
    let redRectImg: UIImage = UIImage(imageLiteralResourceName: "RectangleRed")
    let greenRectImg: UIImage = UIImage(imageLiteralResourceName: "RectangleGreen")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalProgress = questions.count
        update()
        
        print("Current Index: \(currentIndex)")
        restartButton.isHidden = true
    }

    @IBAction func restartButtonPressed(_ sender: Any) {
            restart()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
//        if sender.titleLabel?.text == "Restart" {
//            restart()
//        }
        
        if sender.titleLabel?.text == "True" && Array(questions)[currentIndex].value == true {
            progress += 1
            //sender.backgroundColor = .green
            //sender.setBackgroundImage(greenRectImg, for: .normal)
            changeButtonColor(button: sender, response: true)
        } else if sender.titleLabel?.text == "False" && Array(questions)[currentIndex].value == false {
            progress += 1
            changeButtonColor(button: sender, response: true)
        } else {
            //sender.backgroundColor = .red
            //sender.setBackgroundImage(redRectImg, for: .normal)
            changeButtonColor(button: sender, response: false)
        }
        
        currentIndex += 1
        if(currentIndex < totalProgress) {
            update()
        } else {
            finished()
        }
        print("Current Index: \(currentIndex)")
        print("Progress: \(progress) /\(totalProgress)" )
    }
    
    private func update() {
        scoreLabel.text = "Score: \(progress)"
        progressBar.progress = Float(progress)/Float(totalProgress)
        questionLabel.text = Array(questions)[currentIndex].key
        timeDelay()
    }
    
    private func finished() {
        timeDelay()
        //falseButton.setTitle("Restart", for: .normal)
        restartButton.isHidden = false
        falseButton.isHidden = true
        trueButton.isHidden = true
        progressBar.isHidden = true
        
        var tmp: String?
        let score = (Float(progress)/Float(totalProgress)) * 100
        print("Score: \(score)")
        
        switch score {
        case ..<50:
            tmp = "You didn't do too well..."
        case 51..<65:
            tmp = "Could've done better."
        case 66..<75:
            tmp = "You're not the worst I've seen."
        case 76..<90:
            tmp = "Not bad!"
        case 90..<99:
            tmp = "Very good job!"
        case 100:
            tmp = "You got everything right! What a show off!"
        default:
            tmp = "ERROR: Unable to calculate score."
        }
        tmp! += "\nYou scored \(Int(score))%"
        questionLabel.text = tmp
    }
    
    private func restart() {
        self.questionLabel.text = "Restarting..."
        print("Restarting...")
        restartButton.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            falseButton.setTitle("False", for: .normal)
            progressBar.isHidden = false
            trueButton.isHidden = false
            falseButton.isHidden = false
            currentIndex = 0
            progress = 0
            update()
        }


    }
    
    private func changeButtonColor(button: UIButton, response: Bool) {
        if response {
            button.setBackgroundImage(greenRectImg, for: .normal)
            button.setTitleColor(.green, for: .normal)
        } else {
            button.setBackgroundImage(redRectImg, for: .normal)
            button.setTitleColor(.red, for: .normal)
        }
        button.isUserInteractionEnabled = false
    }
    
    private func timeDelay() {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearButtonBackground), userInfo: nil, repeats: false)
    }
    
    @objc func clearButtonBackground() {
//        falseButton.backgroundColor = .clear
//        trueButton.backgroundColor = .clear
//        
        falseButton.setBackgroundImage(normalRectImg, for: .normal)
        trueButton.setBackgroundImage(normalRectImg, for: .normal)
        
        falseButton.setTitleColor(.white, for: .normal)
        trueButton.setTitleColor(.white, for: .normal)
        
        falseButton.isUserInteractionEnabled = true
        trueButton.isUserInteractionEnabled = true
    }
}


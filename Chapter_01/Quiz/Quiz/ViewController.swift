//
//  ViewController.swift
//  Quiz
//
//  Created by Joel Reeves on 3/10/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                                "What is 7+7?",
                                "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
        
    @IBAction func showAnswer(sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
        // animate the alpha
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                
            })
    }
}


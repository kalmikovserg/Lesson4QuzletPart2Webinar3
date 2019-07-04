//
//  QuestionViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 0
    var questions: [Question]!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var firstStackView: UIStackView!
    @IBOutlet var secondStackView: UIStackView!
    @IBOutlet var thirdStackView: UIStackView!
    
    @IBOutlet var progressLabel: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        updateUI()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        updateUI()
//        switch questionIndex {
//        case 0:
//            firstStackView.isHidden = false
//        case 1:
//            thirdStackView.isHidden = false
//        case 2:
//            secondStackView.isHidden = false
//        default:
//
//        }
        nextQuestion()
    }
    
    func nextQuestion() {
       
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    private func updateUI() {
        
        firstStackView.isHidden = true
        secondStackView.isHidden = true
        thirdStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            firstStackView.isHidden = false
        case .multiple:
            thirdStackView.isHidden = false
        case .range:
            thirdStackView.isHidden = false
        } 
    }
}

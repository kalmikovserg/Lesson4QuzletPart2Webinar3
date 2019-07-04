//
//  QuestionViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var curentQuestion = 0
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
        switch curentQuestion {
        case 0:
            firstStackView.isHidden = false
        case 1:
            thirdStackView.isHidden = false
        case 2:
            secondStackView.isHidden = false
        default:
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        curentQuestion += 1
   }
    
    private func updateUI() {
        firstStackView.isHidden = true
        secondStackView.isHidden = true
        thirdStackView.isHidden = true
        
        navigationItem.title = "  Вопрос № \(curentQuestion + 1) из \(questions.count)"
    }
}

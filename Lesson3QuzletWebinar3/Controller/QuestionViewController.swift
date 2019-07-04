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
    
    var answersChosen: [Answer] = []
    
    var currentQuestion: Question { return questions[questionIndex] }
    var currentAnswers: [Answer] { return currentQuestion.answer }
    
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var rangeLabel: [UILabel]!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var firstStackView: UIStackView!
    @IBOutlet var secondStackView: UIStackView!
    @IBOutlet var thirdStackView: UIStackView!
    
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var progressLabel: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        updateUI()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
         updateUI()
        
        if questionIndex == 1 {
            for (index, stackView) in thirdStackView.arrangedSubviews.enumerated() {
                guard let stackView = view as? UIStackView else { continue }
                guard let swicthView = stackView.arrangedSubviews.last as? UISwitch else { continue }
                if swicthView.isOn {
                    let currentAnswer = currentAnswers[index]
                    answersChosen.append(currentAnswer)
                }
            }
        }
        nextQuestion()
    }
    
    @IBAction func singleButtonPress(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[answerIndex]
        answersChosen.append(answer)
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    private func updateUI() {
        firstStackView.isHidden = true
        secondStackView.isHidden = true
        thirdStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let answers = currentAnswers
        let progress = Float(questionIndex) / Float(questions.count)
        
        progressLabel.setProgress(progress, animated: true)
        questionLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            updateSingleButton(with: answers)
        case .multiple:
            updateMultipleSrack(with: answers)
        case .range:
            updateRangSrack(with: answers)
        }
    }
    
    private func updateSingleButton(with answers: [Answer]) {
        firstStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    private func updateMultipleSrack(with answers: [Answer]) {
        thirdStackView.isHidden = false
        for (label, answer) in zip(multiLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func updateRangSrack(with answers: [Answer]) {
        secondStackView.isHidden = false
        rangeLabel.first?.text = answers.first?.text
        rangeLabel.last?.text = answers.last?.text
    }
}

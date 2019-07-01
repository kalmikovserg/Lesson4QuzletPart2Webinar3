//
//  QuestionViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var curentCustion = 0
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var firstStackView: UIStackView!
    @IBOutlet var secondStackView: UIStackView!
    @IBOutlet var thirdStackView: UIStackView!
    
    @IBOutlet var progressLabel: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        updateUI()
        switch curentCustion {
        case 0:
            firstStackView.isHidden = false
        case 1:
            thirdStackView.isHidden = false
        case 2:
            secondStackView.isHidden = false
        default:
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        curentCustion += 1
   }
    
    private func updateUI() {
        firstStackView.isHidden = true
        secondStackView.isHidden = true
        thirdStackView.isHidden = true
    }
}

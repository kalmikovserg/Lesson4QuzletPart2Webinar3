//
//  WelcomeViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Support.nameUser = nameLabel.text
    }
    @IBOutlet var nameLabel: UITextField!
    
    @IBAction func unwin(_ segue: UIStoryboardSegue) {
        
    }
}

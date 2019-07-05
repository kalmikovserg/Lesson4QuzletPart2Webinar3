//
//  ResultViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var responses: [Answer]!
   
    @IBOutlet var resaltLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updareUI()
        navigationItem.hidesBackButton = true
    }
    
    private func updareUI() {
        let qualityType = responses.map { $0.type }
        var qualityCount = [QualityLife: Int]()
        qualityType.forEach { qualityType in
            qualityCount[qualityType] = (qualityCount[qualityType] ?? 0)  + 1
        }
        let sortedCount = qualityCount.sorted { $0.value > $1.value }
        let answer = sortedCount.first!.key
        
        resaltLabel.text = "Dear \(Support.nameUser ?? "") you are \(answer)"
    }
  
}

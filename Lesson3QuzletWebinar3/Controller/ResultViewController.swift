//
//  ResultViewController.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 6/30/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

import UIKit
import WebKit

class ResultViewController: UIViewController {

    var responses: [Answer]!
   
    @IBOutlet var resaltLabel: UILabel!
    
    @IBOutlet var webPage: WKWebView!
    
    @IBOutlet var labelFate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updareUI()
        navigationItem.hidesBackButton = true
        labelFate.isHidden = false
    }
    
    @IBAction func burgerAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func writeAction(_ sender: UIButton) {
        var statusView = false
        let siteViewArray = view.subviews
        let siteView = siteViewArray
        for line in siteView {
            if line.tag == 13 {
                for interval in stride(from: 0, through: 0.8, by: 0.001) {
                   line.alpha = CGFloat(interval)
                    statusView = true
                labelFate.isHidden = true
                }
            }
        }
        if statusView {
            showFate()
        }
    }
    
    private func showFate() {
      let url = "https://8-gund.com/ru/"
      guard let urlRight = URL(string: url) else { return }
      let urlRequest = URLRequest(url: urlRight)
      webPage.load(urlRequest)
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

//
//  QualityLife.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 7/3/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

enum QualityLife {
    
    case happy
    case single
    case depression
    case timeForVacation
}

extension QualityLife {
    
    var definition: String {
        
        var retValue = ""
        
        switch self {
        case .happy:
            retValue = "Так держать"
        case .single:
            retValue = "Пора на отдых"
        case .depression:
             retValue = "Еще чуть чуть осталось, держимся"
        case .timeForVacation:
            retValue = "ура!!" 
        }
        return retValue
    }
}

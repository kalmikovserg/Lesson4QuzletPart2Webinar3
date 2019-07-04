//
//  Question.swift
//  Lesson3QuzletWebinar3
//
//  Created by Сергей Калмыков on 7/3/19.
//  Copyright © 2019 Сергей Калмыков. All rights reserved.
//

struct Question {        
    var text: String
    var type: ResponsType
    var answer: [Answer]
    
    static var all: [Question] {
        return [
            Question.init(text: "Во сколько начинается вашь рабочий день?", type: .single, answer: [
                Answer(text: "Рано утром", type: .happy),
                Answer(text: "Ближе к обеду", type: .single),
                Answer(text: "Проснуться не могу", type: .timeForVacation),
                Answer(text: "В 8 00  утра", type: .depression),
                ]),
            Question.init(text: "Ваша цель на текущей работе", type: .multiple, answer: [
                Answer(text: "Победить всех", type: .happy),
                Answer(text: "Вечером за учебу", type: .single),
                Answer(text: "Проснуться не могу", type: .timeForVacation),
                Answer(text: "Хочу стать главным начальником", type: .depression),
                ]),
            Question.init(text: "Хотите ли вы в отпуск?", type: .range, answer: [
                Answer(text: "Да, уже почти", type: .happy),
                Answer(text: "В следующем году", type: .single),
                Answer(text: "Да, уже пора", type: .timeForVacation),
                Answer(text: "Зачем мне это?", type: .depression),
                ])
        ]
    }
}

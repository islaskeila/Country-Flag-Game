//
//  Question.swift
//  Country Flag Game
//
//  Created by Keila Islas on 5/16/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}

struct Question: Identifiable {
    var id = UUID()
    var correctAnswer: Answer
    var incorrectAnswer: [Answer]
}

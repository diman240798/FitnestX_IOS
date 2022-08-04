//
//  Exercises.swift
//  FitnestX
//
//  Created by firecode id2 on 04.08.2022.
//

import Foundation

struct ExerciseItem {
    
    let icon: String
    let text: String
    
    init(_ icon: String, _ text: String) {
        self.icon = icon
        self.text = text
    }
}

struct Exercises {
    
    static var hands = ExerciseItem("ic_exercise_hands", "Руки")
    
    static var shoulders = ExerciseItem("ic_exercise_shoulders", "Плечи")
    
    static var chest = ExerciseItem("ic_exercise_chest", "Грудь")
    
    static var back = ExerciseItem("ic_exercise_back", "Спина")
    
    static var legs = ExerciseItem("ic_exercise_legs", "Ноги")
    
    static var glutes = ExerciseItem("ic_exercise_glutes", "Ягодицы")
    
    static var abs = ExerciseItem("ic_exercise_abs", "Живот")
    
    static func values() -> Array<ExerciseItem> {
        return [hands, shoulders, chest, back, legs, glutes, abs]
    }
}

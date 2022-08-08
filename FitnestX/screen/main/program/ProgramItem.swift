//
//  ProgramItem.swift
//  FitnestX
//
//  Created by firecode id2 on 04.08.2022.
//

import Foundation

struct ProgramItem {
    
    let name: String
    let exercisesCount: Int
    let time: Int
    
    init(_ name: String, _ exercisesCount: Int, _ time: Int) {
        self.name = name
        self.exercisesCount = exercisesCount
        self.time = time
    }
}

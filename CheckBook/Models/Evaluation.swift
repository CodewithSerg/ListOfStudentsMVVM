//
//  Evaluation.swift
//  CheckBook
//
//  Created by Sergey Antoniuk on 11.02.22.
//

import Foundation

struct Evaluation {
    let id: String = UUID().uuidString
    let lesson: Lesson
    let mark: Float
}
